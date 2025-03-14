dodge_default = {
	blend_in_dur = 0.4
	blend_out_dur = 0.4
}
dodge_left_short = {
	$dodge_default
	displacement = (1.0, 0.0, 0.0)
	anim_set_id = Human_DodgeLeft_Short_ItemAssociation
}
dodge_left_medium = {
	$dodge_default
	displacement = (2.0, 0.0, 0.0)
	anim_set_id = Human_DodgeLeft_Medium_ItemAssociation
}
dodge_left_long = {
	$dodge_default
	displacement = (3.0, 0.0, 0.0)
	anim_set_id = Human_DodgeLeft
}
dodge_right_short = {
	$dodge_default
	displacement = (-1.0, 0.0, 0.0)
	anim_set_id = Human_DodgeRight_Short_ItemAssociation
}
dodge_right_medium = {
	$dodge_default
	displacement = (-2.0, 0.0, 0.0)
	anim_set_id = Human_DodgeRight_Medium_ItemAssociation
}
dodge_right_long = {
	$dodge_default
	displacement = (-3.0, 0.0, 0.0)
	anim_set_id = Human_DodgeRight
}
trample_standard = {
	trample_speed_standard = 1.0
	trample_speed_ram = 2.0
	trample_damage_standard = 0.0
	trample_damage_ram = 0.0
	should_daze = false
}
reaction_standard = {
	min_combat_delay_secs = 0
	max_combat_delay_secs = 0
	min_cover_attack_delay_secs = 0.4
	max_cover_attack_delay_secs = 2.0
	min_cover_attack_stop_secs = 2.0
	max_cover_attack_stop_secs = 6.0
	min_cover_hide_stop_secs = 1.5
	max_cover_hide_stop_secs = 3.0
	can_cover_peek = true
	min_cover_peek_start_secs = 2.0
	max_cover_peek_start_secs = 15.0
	min_cover_attack_stop_uses = 1
	max_cover_attack_stop_uses = 3
	request_help_delay_secs = 0.5
	request_assistance_delay_secs = 0.5
	potential_trample_react_dist = 6.5
	full_trample_react_dist = 3.0
	min_trample_react_delay_secs = 0.0
	max_trample_react_delay_secs = 0.0
	dodge_from_shot_carry_slot_ids = [
	]
	dodge_from_shot_chance = 0.0
	max_dodge_from_aim_dist = 20
	can_dodge_from_aim = false
	dodge_from_aim_wait_min_secs = 0.0
	dodge_from_aim_wait_max_secs = 0.0
	dodge_left_anims = [
		{
			$dodge_left_short
		}
		{
			$dodge_left_medium
		}
		{
			$dodge_left_long
		}
	]
	dodge_right_anims = [
		{
			$dodge_right_short
		}
		{
			$dodge_right_medium
		}
		{
			$dodge_right_long
		}
	]
	can_proximity_attack = false
	proximity_attack_dist = 0.0
	proximity_attack_item_id = knife
}
reaction_civillian = {
	$reaction_standard
}
reaction_deputy = {
	$reaction_standard
}
reaction_sheriff = {
	$reaction_standard
	dodge_from_shot_carry_slot_ids = [
		pistol
		rifle
		shotgun
		sharpshooter
		bow
	]
	dodge_from_shot_chance = 1.0
	can_dodge_from_aim = true
	dodge_from_aim_wait_min_secs = 0.5
	dodge_from_aim_wait_max_secs = 1.5
	dodge_left_anims = [
		{
			dodge_left_medium
		}
		{
			dodge_left_long
		}
	]
	dodge_right_anims = [
		{
			dodge_right_medium
		}
		{
			dodge_right_long
		}
	]
}
reaction_VirginiaCity_Sheriff = {
	reaction_standard
	dodge_from_shot_carry_slot_ids = [
		pistol
		rifle
		shotgun
		sharpshooter
		bow
	]
	dodge_from_shot_chance = 1.0
	can_dodge_from_aim = true
	dodge_from_aim_wait_min_secs = 0.5
	dodge_from_aim_wait_max_secs = 1.5
	dodge_left_anims = [
		{
			dodge_left_medium
		}
		{
			dodge_left_long
		}
	]
	dodge_right_anims = [
		{
			dodge_right_medium
		}
		{
			dodge_right_long
		}
	]
	can_proximity_attack = true
	proximity_attack_dist = 2.5
	proximity_attack_item_id = super_sabre
}
reaction_bear = {
	reaction_standard
	can_proximity_attack = true
	proximity_attack_dist = 2.5
	proximity_attack_item_id = bear_claw
}
reaction_wolf = {
	reaction_standard
	can_proximity_attack = true
	proximity_attack_dist = 2.5
	proximity_attack_item_id = wolf_bite
}
reaction_brave = {
	reaction_standard
	potential_trample_react_dist = 0.75
	full_trample_react_dist = 0.5
}
reaction_passive_animal = {
	reaction_standard
	potential_trample_react_dist = 0.75
	full_trample_react_dist = 0.5
}
reaction_dodge = {
	reaction_standard
	dodge_from_shot_carry_slot_ids = [
		pistol
		rifle
		shotgun
		sharpshooter
		bow
	]
	dodge_from_shot_chance = 1.0
	can_dodge_from_aim = true
	dodge_from_aim_wait_min_secs = 0.5
	dodge_from_aim_wait_max_secs = 1.5
	dodge_left_anims = [
		{
			dodge_left_short
		}
		{
			dodge_left_medium
		}
	]
	dodge_right_anims = [
		{
			dodge_right_short
		}
		{
			dodge_right_medium
		}
	]
	can_proximity_attack = true
	proximity_attack_dist = 2.5
	proximity_attack_item_id = super_tomahawk
}
reaction_dodge_long = {
	reaction_standard
	dodge_from_shot_carry_slot_ids = [
		pistol
		rifle
		shotgun
		sharpshooter
		bow
	]
	dodge_from_shot_chance = 1.0
	can_dodge_from_aim = true
	dodge_from_aim_wait_min_secs = 0.5
	dodge_from_aim_wait_max_secs = 1.5
	dodge_left_anims = [
		{
			dodge_left_medium
		}
		{
			dodge_left_long
		}
	]
	dodge_right_anims = [
		{
			dodge_right_medium
		}
		{
			dodge_right_long
		}
	]
	can_proximity_attack = true
	proximity_attack_dist = 2.5
	proximity_attack_item_id = sabre
}
reaction_dodge_long_Rudabaugh = {
	reaction_standard
	dodge_from_shot_carry_slot_ids = [
		pistol
		rifle
		shotgun
		sharpshooter
		bow
	]
	dodge_from_shot_chance = 1.0
	can_dodge_from_aim = true
	dodge_from_aim_wait_min_secs = 0.5
	dodge_from_aim_wait_max_secs = 1.5
	dodge_left_anims = [
		{
			dodge_left_medium
		}
		{
			dodge_left_long
		}
	]
	dodge_right_anims = [
		{
			dodge_right_medium
		}
		{
			dodge_right_long
		}
	]
	can_proximity_attack = true
	proximity_attack_dist = 2.5
	proximity_attack_item_id = super_knife
}
reaction_dodge_long_Hollister = {
	reaction_standard
	dodge_from_shot_carry_slot_ids = [
		pistol
		rifle
		shotgun
		sharpshooter
		bow
	]
	dodge_from_shot_chance = 1.0
	can_dodge_from_aim = true
	dodge_from_aim_wait_min_secs = 0.5
	dodge_from_aim_wait_max_secs = 1.5
	dodge_left_anims = [
		{
			dodge_left_medium
		}
		{
			dodge_left_long
		}
	]
	dodge_right_anims = [
		{
			dodge_right_medium
		}
		{
			dodge_right_long
		}
	]
	can_proximity_attack = true
	proximity_attack_dist = 2.5
	proximity_attack_item_id = super_sabre
}
reaction_steamboat = {
	reaction_standard
	can_cover_peek = true
	min_cover_peek_start_secs = 2.0
	max_cover_peek_start_secs = 5.0
}
