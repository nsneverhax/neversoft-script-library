
script RegisterBehaviors_GenEvents_EquippedItem 
	registerstate \{name = Bv_GenEvents_EquippedItem
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = equippeditem
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_EquippedItem_Type
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = equippeditem_type
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_LoadedUses
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = loadeduses
			}
		}
		transitions = [
		]}
endscript
