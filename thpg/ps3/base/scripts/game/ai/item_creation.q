itemattachlocations = {
	lefthand = {
		attach_bone = bone_palm_l
		attach_angles = (3.1399999, 1.57, 3.1399999)
		attach_offset = (0.0, 0.0, 0.0)
	}
	righthand = {
		attach_bone = bone_palm_r
		attach_angles = (0.0, 1.57, 0.0)
		attach_offset = (0.0, 0.0, 0.0)
	}
	root = {
		attach_bone = control_root
		attach_angles = (0.0, 0.0, 0.0)
		attach_offset = (0.0, 0.0, 0.0)
	}
}
skateboard_item_components = [
	{
		component = suspend
	}
	{
		component = attach
	}
	{
		component = motion
	}
	{
		component = item
	}
	{
		component = aiinfo
	}
	{
		component = agent
	}
	{
		component = vehicle
	}
	{
		component = locator
	}
	{
		component = navigation
	}
	{
		component = eventcache
	}
	{
		component = behaviorsystem
	}
	{
		component = seek
	}
	{
		component = animtree
	}
	{
		component = aligntoground
	}
	{
		component = skeleton
	}
	{
		component = model
	}
]
skateboard_item_profile = {
	$Ped_board_details
	species = skateboard
	item_id = skateboard
	agent_stats = stats_standard
	faction = $faction_empty
	navigation = $nav_skateboard
	anim_profile = skateboard_anim_profile
	vehicle_nodes = {
		attach_nodes = [
			{
				name = middle
				attach_type = driver
				offset_pos = (0.0, 0.0, 0.0)
			}
		]
	}
}
skateboard_item_profile_02 = {
	$skateboard_item_profile
	model = 'SpecialItems/extraboard/ped_board.skin'
}

script skateboard_item_init 
	navigation_enable \{off}
	seek_enable \{off}
endscript

script skateboard_item_uninit 
	navigation_enable
	seek_enable
endscript
