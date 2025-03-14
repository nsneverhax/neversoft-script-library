
script RegisterBehaviors_ReloadEquippedItem_Once 
	registerstate \{name = Bv_ReloadItem_Once
		task = {
			name = Task_ReloadItem
			params = {
				finished_event_id = ReloadEquippedItem_Once_Finished
			}
		}
		transitions = [
		]}
endscript
