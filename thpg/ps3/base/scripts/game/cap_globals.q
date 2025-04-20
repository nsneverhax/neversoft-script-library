cap_allow = 1
cap_in_menu = 0
cap_default_camera_dist = 15.0
cap_camera_dist_min = 5.0
cap_camera_dist_max = 25.0
cap_camera_collision_min_dist = 0
cap_max_pieces_allowed = 30
cap_piece_limit_crib = 200
cap_piece_limit_career = 30
cap_max_cameras = 10
cap_max_move_speed = 15.0
cap_max_turn_speed = 2.0
cap_bumper_angle_increment = 45.0
cap_snap_down_dist = -120.0
cap_snap_up_dist = 1.25
cap_max_grab_dist = 5.0
cap_max_snap_dist = 10.0
cap_snap_speed = 20.0
cap_piece_placement_radius = 80
cap_cursor_collision_up_offset = 0.0675
cap_controls = {
	rotate_left = r1
	rotate_right = l1
	raise = up
	lower = down
	exit = select
	place = x
}
cap_ui_handlers = [
	{
		pad_up
		cap_prev_type
	}
	{
		pad_down
		cap_next_type
	}
	{
		pad_right
		cap_next_piece
	}
	{
		pad_left
		cap_prev_piece
	}
	{
		pad_choose
		cap_piece_placed
	}
	{
		pad_circle
		cap_delete_nearest_piece
	}
	{
		pad_square
		cap_grab_nearest_piece
	}
	{
		pad_btn_top
		cap_toggle_controls
	}
	{
		pad_select
		cap_finish
	}
]
cap_mode = rigger
cap_default_category = rails
cap_current_object = null
cap_current_type = null
cap_current_index = 0
cap_index_array = [
]
cap_current_category = rails
cap_current_category_index = 0
cap_place_one_off = 0
cap_crib_object_selected = unset
cap_skater_id = null
cap_last_constructed_index = 0
prev_up_offset = 0.7
cap_valid_array = [
]
cap_rigger_cam_id = null
cap_wrench_modding = false
cap_wrench_in_mod_proxim = false
cap_wrench_in_mod_proxim_script = null
cap_wrench_mod_sound_type = Concrete
cap_training_permit_scrolling = true
cap_grabbed_piece = {
	constructtype = none
}
cap_forced_categories = [
]
Enter_CAP_Debug = {
	trigger = {
		TapTwiceRelease
		select
		select
		550
		condition = cap_allow_rigger_mode_entry
	}
}
Enter_CAP_CD = {
	trigger = {
		tap
		select
		550
		condition = cap_allow_rigger_mode_entry
	}
}
Enter_CAP_Trigger = {
}
cap_categories = [
	{
		name = rails
		is_valid_script = cap_is_valid_category_rigger
	}
	{
		name = Ramps
		is_valid_script = cap_is_valid_category_rigger
	}
	{
		name = verts
		is_valid_script = cap_is_valid_category_rigger
	}
	{
		name = Wrench
		is_valid_script = cap_is_valid_category_wrench
	}
	{
		name = goal
		is_valid_script = cap_is_valid_category_goal
	}
	{
		name = special
		is_valid_script = cap_is_valid_category_camera
	}
	{
		name = NetGoalLayout
		is_valid_script = cap_is_valid_category_net_goal_layout
	}
	{
		name = bling
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Appliance
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Automobile
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Electronics
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Entertainment
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Furniture
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = music
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Skate_Items_S
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Skate_Items_M
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Skate_Items_L
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Themes
		is_valid_script = cap_is_valid_category_crib
	}
	{
		name = Game_Pieces
		is_valid_script = cap_is_valid_category_crib_game_pieces
	}
]
ConstructionTypes = {
	$CAP_Ramp_Objects
	$CAP_Rail_Objects
	$CAP_Vert_Objects
	$CAP_Bling_Objects
	goal = [
	]
	Wrench = [
		{
			name = Wrench
			name_string = "wrench"
			model = 'GameObjects\\ModEnv_Hammer\\ModEnv_Hammer'
			collision = 'none'
			sounds = CAP_Sliding_Sounds_Light_Metal
			NoNodeArray
			norail
			NotPlaceable
			state = {
				up_offset = 0.1
				forward_offset = 4
				camera_dist = 6
				force_to_ground = false
			}
			cursor_components = [
				{
					component = motion
				}
			]
			not_placeable_place_script = cap_wrench_modify_environment
		}
	]
	special = [
		{
			name = camera
			name_string = "camera"
			model = 'Props\\RK_camera_stand\\RK_camera_stand'
			collision = 'Props\\rk_camera_stand_coll\\rk_camera_stand_coll'
			sounds = CAP_Sliding_Sounds_Light_Metal
			state = {
				up_offset = 0.0
				forward_offset = 8
				camera_dist = 15
				force_to_ground = false
			}
			components = [
				{
					component = objectproximity
				}
			]
			create_cursor_script = goal_photo_init_mobile_cam
			delete_cursor_script = goal_photo_kill_cam
			create_script = goal_photo_init_static_cam
			delete_script = goal_photo_kill_cam
		}
	]
	$CAP_NetGoalLayout_Objects
}
rigger_piece_list = [
	CAP_Ramp_Objects
	CAP_Rail_Objects
	CAP_Vert_Objects
]
crib_piece_list = [
	cap_bling_object_raw_list
]
