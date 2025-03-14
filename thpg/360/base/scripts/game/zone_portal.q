
script zone_portal_destroy 
	if iscreated \{zone_portal_anchor}
		zone_portal_anchor :die
	endif
	if screenelementexists \{id = zone_portal_sprite}
		destroyscreenelement \{id = zone_portal_sprite}
	endif
	killskatercamanim \{all}
	if screenelementexists \{id = zone_portal_viewport}
		destroyscreenelement \{id = zone_portal_viewport}
	endif
endscript

script zone_portal_create 
	zone_portal_destroy
	createcompositeobject {
		components = [
			{component = suspend}
			{component = motion}
			{component = objectproximity}
		]
		params = {
			name = zone_portal_anchor
			pos = (0.0, 0.0, 0.0)
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
		}
	}
	skater :obj_getposition
	skater :obj_getquat
	<pos> = (<pos> + (0.0, 1.0, 0.0))
	zone_portal_anchor :obj_setposition position = <pos>
	zone_portal_anchor :obj_setorientation quat = <quat>
	zone_portal_anchor :obj_moveforward dist = 10
	zone_portal_anchor :obj_getposition
	mempushcontext bottomupheap
	createscreenelement {
		parent = root_window
		type = viewportelement
		id = zone_portal_viewport
		texture = viewport0
		pos3d = <pos>
		scale = (5 * (16.0, 9.0))
		z_priority = 10
		near_clip = 0.1
		far_clip = 100.0
		style = viewport_element
	}
	mempopcontext
	playigccam {
		name = zone_portal_cam
		viewport = zone_portal_viewport
		near_clip = 0.1
		far_clip = 100.0
		controlscript = zone_portal_cam_control
	}
	runscriptonobject {
		id = zone_portal_anchor
		zone_portal_init
	}
endscript

script zone_portal_init 
	cleareventhandlergroup \{`default`}
	obj_setinnerradius \{2}
	seteventhandler \{event = anyobjectinradius
		scr = zone_portal_teleport
		response = switch_script}
endscript
zone_portal_cams = [
	{
		lockto = world
		pos = (-139.26933, 6.501288, -41.130207)
		quat = (0.07302199, -0.62853104, 0.059446)
		fov = 72.0
	}
	{
		lockto = world
		pos = (-142.30353, 5.981736, -38.398094)
		quat = (0.053195, -0.79114795, 0.069524996)
		fov = 72.0
	}
]

script zone_portal_cam_control 
	ccam_enablehandcam \{shakeenabled = true
		driftenabled = true}
	ccam_domorph (($zone_portal_cams) [0])
	begin
	ccam_domorph {
		(($zone_portal_cams) [0])
		time = 2.0
		motion = ease_out
	}
	ccam_waitmorph
	ccam_domorph {
		(($zone_portal_cams) [1])
		time = 2.0
		motion = ease_out
	}
	ccam_waitmorph
	repeat
endscript

script zone_portal_teleport 
	spawnscriptlater \{zone_portal_teleport_spawned}
endscript

script zone_portal_teleport_spawned 
	screenflash
	skater :TeleportSkaterToNode \{nodename = Z_Testlevel_TRG_SF_entrypoint_01}
	zone_portal_destroy
endscript
