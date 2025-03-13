
script cas_get_part_camera_pos_bedroom 
	lockto = world
	pos = (2.4528, 1.646541, -0.485349)
	quat = (0.004973, -0.99103093, 0.127851)
	fov = 72.0
	switch <cam_anim>
		case charselect
		pos = (-0.704085, 1.873141, 5.258747)
		quat = (0.088123, -0.82403696, 0.13362099)
		case hand
		case torso
		case adjtorso
		case accessory
		case waist
		pos = (2.5194342, 1.1604009, -1.547142)
		quat = (0.000293, -0.999621, 0.011835)
		case misc_head
		case misc
		case head
		case headtop
		pos = (2.747123, 1.6584179, -1.939943)
		quat = (0.003699, -0.993125, 0.032716)
		case legs
		case pants
		case calves
		pos = (1.7547569, 0.837733, -1.5694607)
		quat = (0.022235999, 0.968292, -0.09333701)
		case shoes
		pos = (2.097709, 0.77432996, -2.0309682)
		quat = (0.061261997, 0.93600094, -0.279276)
		case guitarneck
		case guitarhead
		case guitarbody
		case guitarstart
		pos = (7.4225903, 1.5516059, 4.492661)
		quat = (0.042977996, 0.704103, -0.042772)
		case drumstart
		pos = (7.626858, 1.7709501, -0.81576604)
		quat = (0.053464, 0.81314903, -0.075652)
		case micstart
		pos = (6.53934, 1.3252679, 4.4154077)
		quat = (0.017512, 0.446428, -0.008738)
		case bandlogo
		pos = (0.646733, 1.5153971, -4.602089)
		quat = (0.000177, -0.9993379, 0.036047995)
		default
		nullscript
	endswitch
	return cam_quat = <quat> cam_pos = <pos> cam_fov = <fov>
endscript
