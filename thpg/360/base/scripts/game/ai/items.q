melee_item_default_params = {
	functionality = melee
	item_uses_anims_with_no_target = false
	item_type_id = meleeweapon
	equip_priority_passive = 0.0
	equip_priority_aggressive = 1.0
	item_max_loaded_uses = 0
	item_equip_delay_secs = 0.0
	item_equip_duration_secs = 0.0
	item_unequip_delay_secs = 0.0
	item_unequip_duration_secs = 0.0
	item_use_delay_secs = 0.0
	item_use_duration_secs = 0.0
	item_use_duration_offset_secs = 0.0
	item_reload_duration_secs = 0.0
	item_reload_duration_offset_secs = 0.0
	item_pick_up_duration_secs = 1.0
	item_drop_duration_secs = 0.5
	item_desired_min_range_meters = 0.125
	item_max_range_meters = 1.75
}
fist_attack_1 = {
	impact_radius_meters = 1.5
	impact_offset_meters = 0.5
	impact_time_percent = 0.4
	max_use_range_meters = 1.0
	damage = 10.0
	move_speed = 3.0
	anim_id = Use_Fist_1
	anim_speed_scale = 2.0
	anim_blend_in_duration = 0.4
	anim_blend_out_duration = 0.4
}
dive_fist_attack_1 = {
	impact_radius_meters = 10.0
	impact_offset_meters = 1.0
	impact_time_percent = 0.05
	max_use_range_meters = 2.0
	damage = 10.0
	move_speed = 30.0
	anim_id = Dive_Attack
	anim_speed_scale = 1.0
	anim_blend_in_duration = 0.2
	anim_blend_out_duration = 0.2
}
ai_items = {
	fist = {
		$melee_item_default_params
		item_max_range_meters = 3.0
		item_anim_type = fist
		item_carry_slot_id = fist
		item_equip_type = bothhands
		item_disarmable_bone_groups = [
		]
		melee_attacks = [
			{
				$fist_attack_1
			}
		]
	}
	dive_fist = {
		$melee_item_default_params
		item_max_range_meters = 2.0
		item_anim_type = fist
		item_carry_slot_id = charge
		item_equip_type = bothhands
		item_disarmable_bone_groups = [
		]
		melee_attacks = [
			{
				$dive_fist_attack_1
			}
		]
	}
	skateboard = {
		functionality = prop
		components = $skateboard_item_components
		item_init_script = skateboard_item_init
		item_uninit_script = skateboard_item_uninit
		item_attach_location = righthand
		item_anim_type = skateboard
		item_uses_anims_with_no_target = true
		item_type_id = meleeweapon
		item_carry_slot_id = torch
		item_equip_type = righthand
		equip_priority_passive = 1.0
		equip_priority_aggressive = 1.0
		item_max_loaded_uses = 0
		item_equip_delay_secs = 0.0
		item_equip_duration_secs = 0.0
		item_unequip_delay_secs = 0.0
		item_unequip_duration_secs = 0.0
		item_use_delay_secs = 0.0
		item_use_duration_secs = 0.0
		item_use_duration_offset_secs = 0.0
		item_reload_duration_secs = 0.0
		item_reload_duration_offset_secs = 0.0
		item_pick_up_duration_secs = 0.0
		item_drop_duration_secs = 0.5
		item_desired_min_range_meters = 0
		item_max_range_meters = 0.0
		item_disarmable_bone_groups = [
		]
		rigid_body_params = skateboard_rigid_body_params
		enter_vehicle_start_anim_id = Enter_Skateboard_Item_Start
		enter_vehicle_finish_anim_id = Enter_Skateboard_Item_Finish
		exit_vehicle_start_anim_id = Exit_Skateboard_Item_Start
		exit_vehicle_finish_anim_id = Exit_Skateboard_Item_Finish
		melee_attacks = [
		]
	}
}

script setup_items 
	SetupItems \{struct = ai_items}
endscript
