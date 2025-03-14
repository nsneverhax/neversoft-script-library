Ped_To_Horse_Attachment_Offset = (0.0, 0.0, 0.0)
Ped_To_StageCoach_Attachment_Offset = (0.0, 70.0, 0.0)
ped_to_ped_attachment_offset = (0.0, 0.0, 40.0)
Ped_To_Horse_Detachment_Offset = (32.0, 0.0, 0.0)
Ped_To_StageCoach_Detachment_Offset = (0.0, 70.0, 0.0)
ped_to_ped_detachment_offset = (0.0, 0.0, 40.0)
Horse_To_Leader_Horse_Offset = (50.0, 0.0, 0.0)
Ped_To_Horse_Acquire_Left = {
	start_offset = (40.0, 0.0, 0.0)
	end_offset = (0.0, 0.0, 0.0)
	animation = GUN_H_Mnt_xLx
}
Ped_To_Horse_Acquire_Right = {
	start_offset = (-40.0, 0.0, 0.0)
	end_offset = (0.0, 0.0, 0.0)
	animation = GUN_H_Mnt_xRx
}
Ped_To_Horse_Release_Left = {
	start_offset = (0.0, 0.0, 0.0)
	end_offset = (40.0, 0.0, 0.0)
	animation = GUN_H_DMnt_xLx
}
Ped_To_Horse_Release_Right = {
	start_offset = (0.0, 0.0, 0.0)
	end_offset = (40.0, 0.0, 0.0)
	animation = GUN_H_DMnt_xRx
}

script RegisterBehaviors_Attach 
	registerstate {
		name = Bv_Attach
		task = {name = Task_Attach
			params = {interest_type_id = vehicle
				attach = on
				finished_event_id = Attach_Finished
				failed_event_id = Attach_Failed
			}
		}
	}
	registerstate {
		name = Bv_Detach
		task = {name = Task_Attach
			params = {interest_type_id = vehicle
				attach = off
				finished_event_id = Detach_Finished
				failed_event_id = Detach_Failed
			}
		}
	}
	registerstate {
		name = Bv_SlideAttach
		task = {name = Task_Attach
			params = {interest_type_id = vehicle
				attach = on
				slide = on
				slide_speed = 0.375
				finished_event_id = SlideAttach_Finished
				failed_event_id = SlideAttach_Failed
			}
		}
	}
	registerstate {
		name = Bv_SlideDetach
		task = {name = Task_Attach
			params = {interest_type_id = vehicle
				attach = off
				slide = on
				slide_speed = 0.375
				finished_event_id = SlideDetach_Finished
				failed_event_id = SlideDetach_Failed
			}
		}
	}
endscript
