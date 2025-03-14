targeting_groups = {
	human = {
		target_aim_at_bone_id = bone_head
		target_miss_bone_id = bone_chest
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.6
		target_max_miss_dist_meters = 0.9
		target_accuracy_crouch_scale = 0.75
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = bone_head
				min_dist = 3.75
				weight = 1.0
			}
			{
				bone_id = bone_neck
				min_dist = 3.75
				weight = 0.5
			}
			{
				bone_id = bone_chest
				min_dist = 0.0
				weight = 8.0
			}
			{
				bone_id = bone_bicep_l
				min_dist = 5
				weight = 2.0
			}
			{
				bone_id = bone_forearm_l
				min_dist = 6.25
				weight = 2.0
			}
			{
				bone_id = bone_palm_l
				min_dist = 7.5
				weight = 0.3
			}
			{
				bone_id = bone_bicep_r
				min_dist = 5
				weight = 2.0
			}
			{
				bone_id = bone_forearm_r
				min_dist = 6.25
				weight = 2.0
			}
			{
				bone_id = bone_palm_r
				min_dist = 7.5
				weight = 0.3
			}
			{
				bone_id = bone_pelvis
				min_dist = 3.75
				weight = 3.0
			}
			{
				bone_id = bone_thigh_l
				min_dist = 7.5
				weight = 2.0
			}
			{
				bone_id = bone_knee_l
				min_dist = 8.75
				weight = 2.0
			}
			{
				bone_id = bone_ankle_l
				min_dist = 10
				weight = 0.3
			}
			{
				bone_id = bone_thigh_r
				min_dist = 7.5
				weight = 2.0
			}
			{
				bone_id = bone_knee_r
				min_dist = 8.75
				weight = 2.0
			}
			{
				bone_id = bone_ankle_r
				min_dist = 10
				weight = 0.3
			}
		]
	}
	horse = {
		target_aim_at_bone_id = Bone_H_Chest
		target_miss_bone_id = Bone_H_Chest
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.9
		target_max_miss_dist_meters = 1.5
		target_accuracy_crouch_scale = 1
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = Bone_H_Thigh_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_H_Calf_L
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_H_Thigh_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_H_Calf_R
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_H_Bicep_L
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_H_Forearm_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_H_Bicep_R
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_H_Forearm_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_H_Hip
				min_dist = 5
				weight = 3.0
			}
			{
				bone_id = Bone_H_Chest
				min_dist = 0.0
				weight = 3.0
			}
			{
				bone_id = Bone_H_NeckBase
				min_dist = 7.5
				weight = 2.0
			}
			{
				bone_id = Bone_H_NeckMid
				min_dist = 8.75
				weight = 2.0
			}
			{
				bone_id = Bone_H_Head
				min_dist = 11.25
				weight = 2.0
			}
		]
	}
	cow = {
		target_aim_at_bone_id = Bone_Cow_Chest
		target_miss_bone_id = Bone_Cow_Chest
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.9
		target_max_miss_dist_meters = 1.5
		target_accuracy_crouch_scale = 1
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = Bone_Cow_Knee_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Ankle_L
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Knee_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Ankle_R
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Elbow_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Wrist_L
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Elbow_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Wrist_R
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Cow_Hips
				min_dist = 5
				weight = 4.0
			}
			{
				bone_id = Bone_Cow_Chest
				min_dist = 0.0
				weight = 4.0
			}
			{
				bone_id = Bone_Cow_Head
				min_dist = 5
				weight = 2.0
			}
			{
				bone_id = Bone_Cow_Neck
				min_dist = 7.5
				weight = 2.0
			}
		]
	}
	wolf = {
		target_aim_at_bone_id = Bone_Wolf_Chest
		target_miss_bone_id = Bone_Wolf_Chest
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.9
		target_max_miss_dist_meters = 1.5
		target_accuracy_crouch_scale = 1
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = Bone_Wolf_Knee_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Ankle_L
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Knee_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Ankle_R
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Elbow_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Wrist_L
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Elbow_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Wrist_R
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Wolf_Hips
				min_dist = 5
				weight = 4.0
			}
			{
				bone_id = Bone_Wolf_Chest
				min_dist = 0.0
				weight = 4.0
			}
			{
				bone_id = Bone_Wolf_Head
				min_dist = 5
				weight = 2.0
			}
			{
				bone_id = Bone_Wolf_Neck
				min_dist = 7.5
				weight = 2.0
			}
		]
	}
	bear = {
		target_aim_at_bone_id = Bone_Bear_Chest
		target_miss_bone_id = Bone_Bear_Chest
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.5
		target_max_miss_dist_meters = 1.9
		target_accuracy_crouch_scale = 1
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = Bone_Bear_Knee_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Foot_L
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Knee_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Foot_R
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Forearm_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Wrist_L
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Forearm_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Wrist_R
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Bear_Hips
				min_dist = 5
				weight = 4.0
			}
			{
				bone_id = Bone_Bear_Chest
				min_dist = 0.0
				weight = 4.0
			}
			{
				bone_id = Bone_Bear_Head
				min_dist = 5
				weight = 2.0
			}
			{
				bone_id = Bone_Bear_Neck
				min_dist = 7.5
				weight = 2.0
			}
		]
	}
	quail = {
		target_aim_at_bone_id = Bone_Quail_Body
		target_miss_bone_id = Bone_Quail_Body
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.9
		target_max_miss_dist_meters = 1.5
		target_accuracy_crouch_scale = 1
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = Bone_Quail_Body
				min_dist = 0.0
				weight = 4.0
			}
		]
	}
	prairie_dog = {
		target_aim_at_bone_id = bone_chest
		target_miss_bone_id = bone_chest
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.9
		target_max_miss_dist_meters = 1.5
		target_accuracy_crouch_scale = 1
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = bone_chest
				min_dist = 0.0
				weight = 4.0
			}
		]
	}
	elk = {
		target_aim_at_bone_id = Bone_Elk_Chest
		target_miss_bone_id = Bone_Elk_Chest
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.9
		target_max_miss_dist_meters = 1.5
		target_accuracy_crouch_scale = 1
		target_accuracy_dodge_scale = 0.2
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_bones = [
			{
				bone_id = Bone_Elk_Knee_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Ankle_L
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Knee_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Ankle_R
				min_dist = 10
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Elbow_L
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Wrist_L
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Elbow_R
				min_dist = 8.75
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Wrist_R
				min_dist = 7.5
				weight = 1.0
			}
			{
				bone_id = Bone_Elk_Hips
				min_dist = 5
				weight = 4.0
			}
			{
				bone_id = Bone_Elk_Chest
				min_dist = 0.0
				weight = 4.0
			}
			{
				bone_id = Bone_elk_Head
				min_dist = 5
				weight = 2.0
			}
			{
				bone_id = Bone_Elk_Neck
				min_dist = 7.5
				weight = 2.0
			}
		]
	}
	point = {
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 0.9
		target_max_miss_dist_meters = 1.5
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
	}
	vehicle = {
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 2.75
		target_max_miss_dist_meters = 4
		target_max_hit_dist_meters = 1
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_offset_meters = (0.0, 0.0, 0.0)
	}
	boat = {
		target_max_miss_offset_degrees = 30
		target_min_miss_dist_meters = 110
		target_max_miss_dist_meters = 160
		target_max_hit_dist_meters = 1
		target_accuracy_falloff_min_perp_speed = 10000
		target_accuracy_falloff_max_perp_speed = 10000
		target_offset_meters = (0.0, 0.0, 0.0)
	}
}
