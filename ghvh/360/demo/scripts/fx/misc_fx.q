jowblue = 717488127
jowgreen = 771697407
joworange = -6149377
jowred = -15061505
jowyellow = -3267073

script jow_stars 
	printf \{qs(0x18876fca)}
	printf <...>
	printf \{qs(0x18876fca)}
endscript

script safegetuniquecompositeobjectid \{preferredid = safefxid01}
	if NOT gotparam \{objid}
		getuniquecompositeobjectid preferredid = <preferredid>
		return uniqueid = <uniqueid>
	endif
	i = 0
	formattext textname = index '%i' i = <i>
	extendcrc <preferredid> <index> out = preferredid
	begin
	manglechecksums a = <preferredid> b = <objid>
	if NOT objectexists id = <mangled_id>
		return uniqueid = <preferredid>
	else
		i = (<i> + 1)
		formattext textname = index '%i' i = <i>
		extendcrc <preferredid> <index> out = preferredid
	endif
	repeat
endscript

script setlightintensityovertime \{i = 1.0
		time = 2.0
		steptime = 0.05}
	targeti = <i>
	getlightintensity name = <name>
	numsteps = (<time> / <steptime>)
	casttointeger \{numsteps}
	stepsize = ((<targeti> - <i>) / <numsteps>)
	begin
	i = (<i> + <stepsize>)
	setlightintensity name = <name> intensity = <i>
	wait <steptime> seconds
	repeat (<numsteps> -1)
	setlightintensity name = <name> intensity = <targeti>
endscript

script anim_key 
	obj_movetopos (<mov>) time = <time>
	obj_rotate absolute = <rot> time = <time>
	obj_waitmove
endscript

script changepasscolor \{parameter = m_pspass0materialcolor
		time = 1.0
		steptime = 0.05}
	numsteps = (<time> / <steptime>)
	casttointeger \{numsteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numsteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numsteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numsteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numsteps>)
	begin
	setarrayelement arrayname = startcolor index = 0 newvalue = (<startcolor> [0] + <stepr>)
	setarrayelement arrayname = startcolor index = 1 newvalue = (<startcolor> [1] + <stepg>)
	setarrayelement arrayname = startcolor index = 2 newvalue = (<startcolor> [2] + <stepb>)
	setarrayelement arrayname = startcolor index = 3 newvalue = (<startcolor> [3] + <stepa>)
	updatematerialproperty {
		object = <objid>
		material = <material>
		parameter = <parameter>
		value = <startcolor>
	}
	wait <steptime> seconds
	repeat (<numsteps> -1)
	updatematerialproperty {
		object = <objid>
		material = <material>
		parameter = <parameter>
		value = <endcolor>
	}
endscript

script light_updateposition \{offset = (0.0, 0.0, 0.0)}
	obj_getid
	begin
	if NOT iscreated <attachobjid>
		die
	endif
	<attachobjid> :obj_getposition
	movelight name = <objid> pos = (<pos> + <offset>)
	wait \{1
		frame}
	repeat
endscript

script handofgod_electriccenter_glow 
	destroyscreenelement \{id = hog_electriccenter_glow}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 260.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
endscript

script handofgod_electriccenter_glow_02 
	destroyscreenelement \{id = hog_electriccenter_glow_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow_02
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 260.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_02
endscript

script handofgod_electriccenter_glow_03 
	destroyscreenelement \{id = hog_electriccenter_glow_03}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow_03
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 260.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_03
endscript

script handofgod_electriccenter_flare 
	destroyscreenelement \{id = hog_electriccenter_flare}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare
		texture = jow_flare02
		alpha = 1
		scale = (1.0, 1.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 260.0)
		blend = add
		rot_angle = 45
		z_priority = 3
		rgba = [
			120
			200
			255
			255
		]}
	wait \{2.2
		second}
	destroyscreenelement \{id = hog_electriccenter_flare}
endscript

script handofgod_electriccenter_flare_02 
	destroyscreenelement \{id = hog_electriccenter_flare_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare_02
		texture = jow_buttonflare01
		alpha = 1
		scale = (1.0, 1.0)
		dims = (20.0, 20.0)
		just = [
			center
			center
		]
		pos = (640.0, 260.0)
		blend = add
		z_priority = 3
		rgba = [
			220
			240
			255
			255
		]}
	handofgod_electriccenter_flare_02_anim
endscript

script handofgod_electriccenter 
	destroyscreenelement \{id = hog_electriccenter}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter
		texture = ph_electricity_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 260.0)
		blend = add
		z_priority = 2
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale}
endscript

script handofgod_electriccenter_02 
	destroyscreenelement \{id = hog_electriccenter_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_02
		texture = ph_electricity_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 260.0)
		rot_angle = 45
		blend = add
		z_priority = 2
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	handofgod_electriccenter_anim_scale_02
endscript

script handofgod_electriccenter_glow_anim 
	handofgod_electriccenter_glow
	begin
	hog_electriccenter_glow :se_setprops scale = (2.2, 2.2) alpha = 0.4 time = 0.05 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	hog_electriccenter_glow :se_setprops scale = (2.0, 2.0) alpha = 0.6 time = 0.1 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	repeat 12
	destroyscreenelement \{id = hog_electriccenter_glow}
endscript

script handofgod_electriccenter_glow_anim_02 
	begin
	hog_electriccenter_glow_02 :se_setprops \{scale = (0.5, 0.5)
		alpha = 1}
	hog_electriccenter_glow_02 :se_setprops \{scale = (3.0, 3.0)
		alpha = 0
		time = 0.2}
	hog_electriccenter_glow_02 :se_waitprops
	repeat 7
	destroyscreenelement \{id = hog_electriccenter_glow_02}
endscript

script handofgod_electriccenter_glow_anim_03 
	hog_electriccenter_glow_03 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.4}
	hog_electriccenter_glow_03 :se_setprops \{scale = (1.0, 1.0)
		alpha = 0
		time = 1}
	hog_electriccenter_glow_03 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_glow_02}
endscript

script handofgod_electriccenter_anim_scale 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter :se_setprops \{scale = (1.0, 1.0)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter :se_waitprops
	hog_electriccenter :se_setprops \{scale = (1.3, 1.3)
		alpha = 1
		time = 0.1}
	hog_electriccenter :se_waitprops
	repeat 9
	destroyscreenelement \{id = hog_electriccenter}
endscript

script handofgod_electriccenter_anim_scale_02 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_02 :se_setprops rot_angle = <rot>
	hog_electriccenter_02 :se_setprops \{scale = (1.0, 1.0)
		alpha = 1}
	hog_electriccenter_02 :se_waitprops
	hog_electriccenter_02 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0
		time = 0.2}
	hog_electriccenter_02 :se_waitprops
	repeat 10
	destroyscreenelement \{id = hog_electriccenter_02}
endscript

script handofgod_electriccenter_flare_02_anim 
	hog_electriccenter_flare_02 :se_setprops \{scale = (200.0, 200.0)
		rot_angle = -360
		alpha = 0.5
		time = 0.1}
	hog_electriccenter_flare_02 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_flare_02}
endscript

script handofgod_electriccenter_combo 
	spawnscriptnow \{handofgod_electriccenter_glow_anim}
	spawnscriptnow \{handofgod_electriccenter}
	spawnscriptnow \{handofgod_electriccenter_02}
	spawnscriptnow \{handofgod_electriccenter_flare}
	spawnscriptnow \{handofgod_smoke_01}
	spawnscriptnow \{handofgod_electriccenter_sparks_01}
endscript

script handofgod_fx_01 
	spawnscriptnow \{handofgod_electriccenter_glow_anim}
	spawnscriptnow \{handofgod_electriccenter}
	spawnscriptnow \{handofgod_electriccenter_02}
	spawnscriptnow \{handofgod_electriccenter_flare}
	spawnscriptnow \{handofgod_smoke_01}
	spawnscriptnow \{handofgod_electriccenter_sparks_01}
	spawnscriptnow \{handofgod_lightning_combo}
	wait \{2.2
		second}
	handofgod_electriccenter_flare_02
endscript

script handofgod_fx_02 
	spawnscriptnow \{handofgod_electriccenter_glow_02}
	spawnscriptnow \{handofgod_electriccenter_sparks_02}
	wait \{0.2
		second}
	handofgod_smoke_02
	handofgod_electriccenter_glow_03
endscript

script handofgod_lightning_god 
	destroyscreenelement \{id = hog_lightning_god}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_lightning_god
		alpha = 1
		scale = (0.8, 0.8)
		just = [
			center
			center
		]
		pos = (800.0, 170.0)
		rot_angle = 60
		material = sys_big_bolt01_sys_big_bolt01
		z_priority = 1}
	wait \{2.2
		second}
	destroyscreenelement \{id = hog_lightning_god}
endscript

script handofgod_lighting_devil 
	destroyscreenelement \{id = hog_lighting_devil}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_lighting_devil
		alpha = 1
		scale = (1.1, 1.1)
		just = [
			center
			center
		]
		pos = (410.0, 435.0)
		rot_angle = 232
		material = sys_big_bolt01_red_sys_big_bolt01_red
		z_priority = 1}
	wait \{2.2
		second}
	destroyscreenelement \{id = hog_lighting_devil}
endscript

script handofgod_lightning_combo 
	spawnscriptnow \{handofgod_lightning_god}
	spawnscriptnow \{handofgod_lighting_devil}
endscript

script handofgod_fx_kill 
	destroyscreenelement \{id = hog_electriccenter_glow}
	destroyscreenelement \{id = hog_electriccenter_flare}
	destroyscreenelement \{id = hog_electriccenter}
	destroyscreenelement \{id = hog_lightning_god}
	destroyscreenelement \{id = hog_lighting_devil}
endscript

script handofgod_electriccenter_sparks_01 
	destroy2dparticlesystem \{id = electriccenter_sparks_01}
	wait \{1
		frame}
	create2dparticlesystem \{id = electriccenter_sparks_01
		pos = (640.0, 260.0)
		z_priority = 2
		material = sys_particle_spark01_sys_particle_spark01
		parent = root_window
		start_color = [
			100
			200
			255
			255
		]
		end_color = [
			100
			200
			255
			0
		]
		start_scale = (1.2, 1.2)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.03
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 20.0)
		time = 0.5}
	wait \{2.2
		second}
	destroy2dparticlesystem \{id = electriccenter_sparks_01}
endscript

script handofgod_electriccenter_sparks_02 
	destroy2dparticlesystem \{id = electriccenter_sparks_02}
	wait \{1
		frame}
	create2dparticlesystem \{id = electriccenter_sparks_02
		pos = (640.0, 260.0)
		z_priority = 2
		material = sys_particle_spark01_sys_particle_spark01
		parent = root_window
		start_color = [
			100
			200
			255
			255
		]
		end_color = [
			100
			200
			255
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 20
		friction = (0.0, 20.0)
		time = 0.5}
	wait \{1.5
		second}
	destroy2dparticlesystem \{id = electriccenter_sparks_02}
endscript

script handofgod_smoke_01 
	destroy2dparticlesystem \{id = hog_smoke_01}
	create2dparticlesystem \{id = hog_smoke_01
		pos = (640.0, 260.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = root_window
		start_color = [
			140
			200
			255
			175
		]
		end_color = [
			140
			200
			255
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.5
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 4
		friction = (0.0, 0.0)
		time = 0.5}
	wait \{2
		second}
	destroy2dparticlesystem \{id = hog_smoke_01}
endscript

script handofgod_smoke_02 
	destroy2dparticlesystem \{id = hog_smoke_02}
	create2dparticlesystem \{id = hog_smoke_02
		pos = (640.0, 260.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = root_window
		start_color = [
			140
			200
			255
			40
		]
		end_color = [
			140
			200
			255
			0
		]
		start_scale = (2.0, 2.0)
		end_scale = (6.0, 6.0)
		start_angle_spread = 360.0
		min_rotation = -1000.0
		max_rotation = 900.0
		emit_start_radius = 2.0
		emit_radius = 3.0
		emit_rate = 0.09
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 0.0)
		time = 1}
	wait \{1.3499999
		second}
	destroy2dparticlesystem \{id = hog_smoke_02
		kill_when_empty}
endscript

script spit_vocalist_large 
	if compositeobjectexists \{vocalist}
		getuniquecompositeobjectid \{preferredid = jamesspit_01}
		createparticlesystem name = <uniqueid> objid = vocalist bone = bone_tongue params_script = $gp_fx_spit_01 groupid = zoneparticles
	endif
endscript

script spit_vocalist_small 
	if compositeobjectexists \{vocalist}
		getuniquecompositeobjectid \{preferredid = jamesspit_01}
		createparticlesystem name = <uniqueid> objid = vocalist bone = bone_tongue params_script = $gp_fx_spit_small_01 groupid = zoneparticles
	endif
endscript

script mouthfog_vocalist 
	if compositeobjectexists \{vocalist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_01}
		createparticlesystem name = <uniqueid> objid = vocalist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script mouthfog_guitarist 
	if compositeobjectexists \{guitarist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_01}
		createparticlesystem name = <uniqueid> objid = guitarist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script mouthfog_bassist 
	if compositeobjectexists \{bassist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_01}
		createparticlesystem name = <uniqueid> objid = bassist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script mouthfog_drummer 
	if compositeobjectexists \{drummer}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_01}
		createparticlesystem name = <uniqueid> objid = drummer bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script camerablur_fastzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.1}
	wait \{0.2
		seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.3}
	wait \{0.2
		seconds}
	bg_fx_set_blur \{appendstrength = 0.5
		time = 0.1}
	wait \{0.1
		second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_slowzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.5}
	wait \{0.4
		seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.4}
	wait \{0.5
		seconds}
	bg_fx_set_blur \{appendstrength = 1
		time = 0.3}
	wait \{0.3
		second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_focusin 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0}
	wait \{0.1
		second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.5
endscript

script camerablur_focusout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.6}
endscript

script camerafx_whiteflash 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_whiteflash \{appendbrightness = 100
		time = 0}
	wait \{0.06
		second}
	if viewportexists \{id = bg_viewport}
		bg_fx_set_brightness_whiteflash effectparams = <startvalue> time = 0.06
	endif
endscript

script camerafx_blackfadein 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	onexitrun camerafx_blackfadein_cleanup params = {startvalue = <startvalue>}
	bg_fx_set_brightness_blackfade appendbrightness = 0 time = (<length> * 0.001)
	block
endscript

script camerafx_blackfadein_cleanup 
	if viewportexists \{id = bg_viewport}
		bg_fx_set_brightness_blackfade effectparams = <startvalue>
	endif
endscript

script camerafx_blackfadeout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_blackfade \{appendbrightness = 0
		time = 0}
	wait \{1
		frame}
	bg_fx_set_brightness_blackfade \{appendbrightness = 1
		time = 0.75}
endscript

script camerafx_blackfadeout_careerintro 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_blackfade \{appendbrightness = 0
		time = 0}
	wait \{1
		frame}
	bg_fx_set_brightness_blackfade effectparams = <startvalue> time = 0.5
endscript

script one_introfx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		one_introfx_justice
		case z_donnington
		one_introfx_donnington
		case z_forum
		one_introfx_forum
		case z_icecave
		one_introfx_icecave
		case z_meadowlands
		one_introfx_meadowlands
		case z_mop
		one_introfx_mop
		case z_stone
		one_introfx_stone
		case z_tushino
		one_introfx_tushino
	endswitch
endscript

script one_introfx_justice 
	tod_proxim_apply_careerintrofx
	lightshow_settime \{time = 1.5}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	safekill \{nodename = z_justice_gfx_fx_sunflare_01}
	safekill \{nodename = z_justice_gfx_fx_sunflare_01}
	kill \{prefix = z_justice_gfx_fx_oneintro}
	wait \{1
		frame}
	create \{prefix = z_justice_gfx_fx_oneintro}
	safecreate \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_justice_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_justice_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_justice_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_justice_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_justice_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_justice_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.3
		seconds}
	kill \{prefix = z_justice_gfx_fx_oneintro}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	enablelight \{name = z_justice_gfx_fx_oneintrojamesomni_01}
	wait \{18.5
		seconds}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare}
	safekill \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	disablelight \{name = z_donnington_gfx_fx_oneintrojamesomni_01}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = tension_02
		usesnapshotpositions = true
		save = true}
endscript

script one_introfx_donnington 
	tod_proxim_apply_careerintrofx
	lightshow_settime \{time = 1.5}
	lightshow_playsnapshot \{name = silhouette01
		usesnapshotpositions = true
		save = true}
	kill \{prefix = z_donnington_gfx_fx_oneintro}
	wait \{1
		frame}
	create \{prefix = z_donnington_gfx_fx_oneintro}
	safecreate \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_donnington_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_donnington_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_donnington_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_donnington_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_donnington_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_donnington_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.3
		seconds}
	kill \{prefix = z_donnington_gfx_fx_oneintro}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	enablelight \{name = z_donnington_gfx_fx_oneintrojamesomni_01}
	wait \{18.5
		seconds}
	safekill \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	disablelight \{name = z_donnington_gfx_fx_oneintrojamesomni_01}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = blackout01
		usesnapshotpositions = true
		save = true}
endscript

script one_introfx_forum 
	tod_proxim_apply_careerintrofx
	lightshow_settime \{time = 1.5}
	lightshow_playsnapshot \{name = strobe03
		usesnapshotpositions = true
		save = true}
	kill \{prefix = z_forum_gfx_fx_oneintro}
	wait \{1
		frame}
	create \{prefix = z_forum_gfx_fx_oneintro}
	safecreate \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_forum_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_forum_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_forum_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_forum_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_forum_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_forum_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.3
		seconds}
	kill \{prefix = z_forum_gfx_fx_oneintro}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	enablelight \{name = z_forum_gfx_fx_oneintrojamesomni_01}
	wait \{18.5
		seconds}
	safekill \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = blackout
		usesnapshotpositions = true
		save = true}
	disablelight \{name = z_forum_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_icecave 
	tod_proxim_apply_careerintrofx
	lightshow_settime \{time = 1.5}
	lightshow_playsnapshot \{name = strobe_03
		usesnapshotpositions = true
		save = true}
	kill \{prefix = z_icecave_gfx_fx_oneintro}
	wait \{1
		frame}
	create \{prefix = z_icecave_gfx_fx_oneintro}
	safecreate \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_icecave_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_icecave_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_icecave_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_icecave_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_icecave_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_icecave_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.3
		seconds}
	kill \{prefix = z_icecave_gfx_fx_oneintro}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	enablelight \{name = z_icecave_gfx_fx_oneintrojamesomni_01}
	wait \{18.5
		seconds}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = blackout_01
		usesnapshotpositions = true
		save = true}
	safekill \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	disablelight \{name = z_icecave_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_meadowlands 
	tod_proxim_apply_careerintrofx
	lightshow_settime \{time = 1.5}
	lightshow_playsnapshot \{name = encore_cut01
		usesnapshotpositions = true
		save = true}
	kill \{prefix = z_meadowlands_gfx_fx_oneintro}
	wait \{1
		frame}
	create \{prefix = z_meadowlands_gfx_fx_oneintro}
	safecreate \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_meadowlands_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_meadowlands_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_meadowlands_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_meadowlands_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_meadowlands_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_meadowlands_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.3
		seconds}
	kill \{prefix = z_meadowlands_gfx_fx_oneintro}
	safecreate \{nodename = z_meadowlands_gfx_fx_oneintrosunflare_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	enablelight \{name = z_meadowlands_gfx_fx_oneintrojamesomni_01}
	wait \{18.5
		seconds}
	safekill \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	safekill \{nodename = z_meadowlands_gfx_fx_oneintrosunflare_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	disablelight \{name = z_meadowlands_gfx_fx_oneintrojamesomni_01}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = resolution02
		usesnapshotpositions = true
		save = true}
endscript

script one_introfx_mop 
	tod_proxim_apply_careerintrofx
	lightshow_settime \{time = 1.5}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	kill \{prefix = z_mop_gfx_fx_oneintro}
	wait \{1
		frame}
	create \{prefix = z_mop_gfx_fx_oneintro}
	safecreate \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_mop_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_mop_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_mop_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_mop_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_mop_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_mop_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.3
		seconds}
	kill \{prefix = z_mop_gfx_fx_oneintro}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	enablelight \{name = z_mop_gfx_fx_oneintrojamesomni_01}
	wait \{18.6
		seconds}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare}
	safekill \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	disablelight \{name = z_mop_gfx_fx_oneintrojamesomni_01}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = climax01
		usesnapshotpositions = true
		save = true}
endscript

script one_introfx_stone 
	tod_proxim_apply_careerintrofx
	kill \{prefix = z_stone_gfx_fx_oneintro}
	wait \{0.2
		second}
	create \{prefix = z_stone_gfx_fx_oneintro}
	safecreate \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	lightshow_settime \{time = 1.3}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_stone_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_stone_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_stone_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_stone_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_stone_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_stone_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.4
		seconds}
	kill \{prefix = z_stone_gfx_fx_oneintro}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	enablelight \{name = z_stone_gfx_fx_oneintrojamesomni_01}
	wait \{18.3
		seconds}
	safekill \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = blackout
		usesnapshotpositions = true
		save = true}
	disablelight \{name = z_stone_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_tushino 
	tod_proxim_apply_careerintrofx
	lightshow_settime \{time = 1.5}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	kill \{prefix = z_tushino_gfx_fx_oneintro}
	wait \{1
		frame}
	create \{prefix = z_tushino_gfx_fx_oneintro}
	safecreate \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	wait \{2.5
		seconds}
	safecreate \{nodename = z_tushino_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_tushino_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{3.6
		seconds}
	safecreate \{nodename = z_tushino_gfx_fx_oneintrorightflash_01}
	safecreate \{nodename = z_tushino_gfx_fx_oneintrorightflash_02}
	spawnscriptnow \{one_introfx_explosions_02}
	wait \{2.2
		seconds}
	safecreate \{nodename = z_tushino_gfx_fx_oneintroleftflash_01}
	safecreate \{nodename = z_tushino_gfx_fx_oneintroleftflash_02}
	spawnscriptnow \{one_introfx_explosions_01}
	wait \{1.3
		seconds}
	kill \{prefix = z_tushino_gfx_fx_oneintro}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	enablelight \{name = z_tushino_gfx_fx_oneintrojamesomni_01}
	wait \{18.4
		seconds}
	safekill \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	lightshow_settime \{time = 2}
	lightshow_playsnapshot \{name = strobe09
		usesnapshotpositions = true
		save = true}
	disablelight \{name = z_tushino_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_explosions_01 
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_left_01}
	createparticlesystem name = <uniqueid> pos = (-3.84608, 0.0, 0.77381605) params_script = $gp_fx_sparkfountain_big_sparks_01 groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_left_02}
	createparticlesystem name = <uniqueid> pos = (-3.84608, 0.0, 0.77381605) params_script = $gp_fx_sparkfountain_frontflash_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_left_03}
	createparticlesystem name = <uniqueid> pos = (-3.84608, 0.0, 0.77381605) params_script = $gp_fx_sparkfountain_frontglow_01 groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_left_04}
	createparticlesystem name = <uniqueid> pos = (-3.84608, 0.0, 0.77381605) params_script = $gp_fx_sparkfountain_sparks_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_left_05}
	createparticlesystem name = <uniqueid> pos = (-3.84608, 0.0, 0.77381605) params_script = $gp_fx_encore_es_sparks_01 groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_left_06}
	createparticlesystem name = <uniqueid> pos = (-3.84608, 0.0, 0.77381605) params_script = $gp_fx_encore_es_smoke_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_left_07}
	createparticlesystem name = <uniqueid> pos = (-3.84608, 0.0, 0.77381605) params_script = $gp_fx_encore_es_pulseglow_01 groupid = zoneparticles
endscript

script one_introfx_explosions_02 
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_right_01}
	createparticlesystem name = <uniqueid> pos = (3.64269, 0.0, 0.28839597) params_script = $gp_fx_sparkfountain_big_sparks_01 groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_right_02}
	createparticlesystem name = <uniqueid> pos = (3.64269, 0.0, 0.28839597) params_script = $gp_fx_sparkfountain_frontflash_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_right_03}
	createparticlesystem name = <uniqueid> pos = (3.64269, 0.0, 0.28839597) params_script = $gp_fx_sparkfountain_frontglow_01 groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_right_04}
	createparticlesystem name = <uniqueid> pos = (3.64269, 0.0, 0.28839597) params_script = $gp_fx_sparkfountain_sparks_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_right_05}
	createparticlesystem name = <uniqueid> pos = (3.64269, 0.0, 0.28839597) params_script = $gp_fx_encore_es_sparks_01 groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_right_06}
	createparticlesystem name = <uniqueid> pos = (3.64269, 0.0, 0.28839597) params_script = $gp_fx_encore_es_smoke_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = one_introfx_explosions_right_07}
	createparticlesystem name = <uniqueid> pos = (3.64269, 0.0, 0.28839597) params_script = $gp_fx_encore_es_pulseglow_01 groupid = zoneparticles
endscript

script one_introfx_kill 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		one_introfx_justice_kill
		case z_donnington
		one_introfx_donnington_kill
		case z_forum
		one_introfx_forum_kill
		case z_icecave
		one_introfx_icecave_kill
		case z_meadowlands
		one_introfx_meadowlands_kill
		case z_mop
		one_introfx_mop_kill
		case z_stone
		one_introfx_stone_kill
		case z_tushino
		one_introfx_tushino_kill
	endswitch
endscript

script one_introfx_justice_kill 
	safekill \{nodename = z_justice_gfx_fx_oneintro2_james_lh_05}
	safekill \{nodename = z_justice_gfx_fx_sunflare_01}
	kill \{prefix = z_justice_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_justice_gfx_fx_oneintrojamesomni_01}
	safekill \{nodename = z_justice_gfx_fx_encore_lh_01}
endscript

script one_introfx_donnington_kill 
	kill \{prefix = z_donnington_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_donnington_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_forum_kill 
	safekill \{nodename = z_forum_gfx_careerintro_ground}
	safecreate \{nodename = z_forum_js_ground}
	safecreate \{nodename = z_forum_js_walkway_pipes_intro}
	kill \{prefix = z_forum_gfx_fx_careerintrosunflare
		noprefixwarning}
	safekill \{nodename = z_forum_gfx_careerintro_smoke_01}
	safecreate \{nodename = z_forum_tunnel_light}
	safekill \{nodename = z_forum_gfx_fx_oneintro2_james_lh_06}
	kill \{prefix = z_forum_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_forum_gfx_fx_oneintrojamesomni_01}
	disablelight \{name = z_forum_gfx_careerintro_pyrolight_01}
	disablelight \{name = z_forum_gfx_careerintro_pyrolight_front_01}
	safekill \{nodename = z_forum_gfx_careerintro_dust_01}
	kill \{prefix = z_forum_gfx_fx_careerintrosunflare02
		noprefixwarning}
	kill \{prefix = z_forum_gfx_fx_encore_smoke
		noprefixwarning}
	kill \{prefix = z_forum_gfx_fx_encore_lh_snakes
		noprefixwarning}
	safekill \{nodename = z_forum_gfx_fx_careerintro_drumlh}
endscript

script one_introfx_icecave_kill 
	kill \{prefix = z_icecave_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_icecave_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_meadowlands_kill 
	kill \{prefix = z_meadowlands_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_meadowlands_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_mop_kill 
	kill \{prefix = z_mop_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_mop_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_stone_kill 
	kill \{prefix = z_stone_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_stone_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_tushino_kill 
	kill \{prefix = z_tushino_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{name = z_tushino_gfx_fx_oneintrojamesomni_01}
endscript

script ffwf_introfx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		ffwf_introfx_justice
		case z_donnington
		ffwf_introfx_donnington
		case z_forum
		ffwf_introfx_forum
		case z_icecave
		ffwf_introfx_icecave
		case z_meadowlands
		ffwf_introfx_meadowlands
		case z_mop
		ffwf_introfx_mop
		case z_stone
		ffwf_introfx_stone
		case z_tushino
		ffwf_introfx_tushino
	endswitch
endscript

script ffwf_introfx_justice 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_justice_gfx_fx_smoke
		noprefixwarning}
	safekill \{nodename = z_justice_gfx_fx_crowdfog_01}
	wait \{1
		second}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	wait \{38
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = tension_02
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_justice_gfx_fx_smoke}
	safekill \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_donnington 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_donnington_gfx_fx_smoke
		noprefixwarning}
	safekill \{nodename = z_donnington_gfx_fx_crowdfog_01}
	wait \{1
		second}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = silhouette01
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	wait \{38
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = climax02
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_donnington_gfx_fx_smoke}
	safekill \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_forum 
	lightshow_settime \{time = 0}
	lightshow_playsnapshot \{name = strobe03
		usesnapshotpositions = true
		save = true}
	tod_proxim_apply_careerintrofx
	kill \{prefix = z_forum_gfx_fx_smoke
		noprefixwarning}
	safecreate \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	wait \{39
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = exposition04
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_forum_gfx_fx_smoke}
	safekill \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_icecave 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_icecave_gfx_fx_smoke
		noprefixwarning}
	wait \{1
		second}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = strobe_03
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	wait \{38
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = pyro
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_icecave_gfx_fx_smoke}
	safekill \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_meadowlands 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_meadowlands_gfx_fx_smoke
		noprefixwarning}
	wait \{1
		second}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = encore_cut01
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	wait \{38
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = exposition02
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_meadowlands_gfx_fx_smoke}
	safekill \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_mop 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_mop_gfx_fx_smoke
		noprefixwarning}
	safekill \{nodename = z_mop_gfx_fx_crowdfog_01}
	wait \{1
		second}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	wait \{38
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = rising06
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_mop_gfx_fx_smoke}
	safekill \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_stone 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_stone_gfx_fx_smoke
		noprefixwarning}
	safekill \{nodename = z_stone_gfx_fx_crowdfog_01}
	wait \{1
		second}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	wait \{38
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = exposition05
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_stone_gfx_fx_smoke}
	safekill \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_tushino 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_tushino_gfx_fx_smoke
		noprefixwarning}
	safekill \{nodename = z_tushino_gfx_fx_crowdfog_01}
	wait \{1
		second}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = ffwf
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	wait \{38
		seconds}
	lightshow_settime \{time = 7}
	lightshow_playsnapshot \{name = climax02
		usesnapshotpositions = true
		save = true}
	wait \{20
		seconds}
	create \{prefix = z_tushino_gfx_fx_smoke}
	safekill \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_kill 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		ffwf_introfx_justice_kill
		case z_donnington
		ffwf_introfx_donnington_kill
		case z_forum
		ffwf_introfx_forum_kill
		case z_icecave
		ffwf_introfx_icecave_kill
		case z_meadowlands
		ffwf_introfx_meadowlands_kill
		case z_mop
		ffwf_introfx_mop_kill
		case z_stone
		ffwf_introfx_stone_kill
		case z_tushino
		ffwf_introfx_tushino_kill
	endswitch
endscript

script ffwf_introfx_justice_kill 
	safekill \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_donnington_kill 
	safekill \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_forum_kill 
	safekill \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_icecave_kill 
	safekill \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_meadowlands_kill 
	safekill \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_mop_kill 
	safekill \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_stone_kill 
	safekill \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_tushino_kill 
	safekill \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script lemmy_introfx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		lemmy_introfx_justice
		case z_donnington
		lemmy_introfx_donnington
		case z_forum
		lemmy_introfx_forum
		case z_icecave
		lemmy_introfx_icecave
		case z_meadowlands
		lemmy_introfx_meadowlands
		case z_mop
		lemmy_introfx_mop
		case z_stone
		lemmy_introfx_stone
		case z_tushino
		lemmy_introfx_tushino
	endswitch
endscript

script lemmy_introfx_justice 
	safecreate \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro_01
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_donnington 
	safecreate \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro01
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_forum 
	safecreate \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_icecave 
	safecreate \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro_01
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_meadowlands 
	safecreate \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_mop 
	safecreate \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_stone 
	safecreate \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_tushino 
	safecreate \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_kill 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		lemmy_introfx_justice_kill
		case z_donnington
		lemmy_introfx_donnington_kill
		case z_forum
		lemmy_introfx_forum_kill
		case z_icecave
		lemmy_introfx_icecave_kill
		case z_meadowlands
		lemmy_introfx_meadowlands_kill
		case z_mop
		lemmy_introfx_mop_kill
		case z_stone
		lemmy_introfx_stone_kill
		case z_tushino
		lemmy_introfx_tushino_kill
	endswitch
endscript

script lemmy_introfx_justice_kill 
	safekill \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_donnington_kill 
	safekill \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_forum_kill 
	safekill \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_icecave_kill 
	safekill \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_meadowlands_kill 
	safekill \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_mop_kill 
	safekill \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_stone_kill 
	safekill \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_tushino_kill 
	safekill \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		kingdiamond_introfx_justice
		case z_donnington
		kingdiamond_introfx_donnington
		case z_forum
		kingdiamond_introfx_forum
		case z_icecave
		kingdiamond_introfx_icecave
		case z_meadowlands
		kingdiamond_introfx_meadowlands
		case z_mop
		kingdiamond_introfx_mop
		case z_stone
		kingdiamond_introfx_stone
		case z_tushino
		kingdiamond_introfx_tushino
	endswitch
endscript

script kingdiamond_introfx_justice 
	safecreate \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro_01
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_donnington 
	safecreate \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro01
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_forum 
	safecreate \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_icecave 
	safecreate \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro_01
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_meadowlands 
	safecreate \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_mop 
	safecreate \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_stone 
	safecreate \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_tushino 
	safecreate \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_kill 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_justice
		kingdiamond_introfx_justice_kill
		case z_donnington
		kingdiamond_introfx_donnington_kill
		case z_forum
		kingdiamond_introfx_forum_kill
		case z_icecave
		kingdiamond_introfx_icecave_kill
		case z_meadowlands
		kingdiamond_introfx_meadowlands_kill
		case z_mop
		kingdiamond_introfx_mop_kill
		case z_stone
		kingdiamond_introfx_stone_kill
		case z_tushino
		kingdiamond_introfx_tushino_kill
	endswitch
endscript

script kingdiamond_introfx_justice_kill 
	safekill \{nodename = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_donnington_kill 
	safekill \{nodename = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_forum_kill 
	safekill \{nodename = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_icecave_kill 
	safekill \{nodename = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_meadowlands_kill 
	safekill \{nodename = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_mop_kill 
	safekill \{nodename = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_stone_kill 
	safekill \{nodename = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_tushino_kill 
	safekill \{nodename = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare
		noprefixwarning}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript
