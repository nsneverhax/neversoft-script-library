
script RegisterBehaviors_ManageItems 
	registerstate \{name = Bv_ManageAllItems
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = equip
						state = Bv_EnableItemControlEquip
					}
					{
						replacement = use
						state = Bv_ManageEquippedItem
					}
				]
			}
		]}
	registerstate \{name = Bv_ManageEquippedItem
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = reload
						state = Bv_EnableItemControlReload
					}
					{
						replacement = use
						state = Bv_AutoUseEquippedItem_Loop
					}
				]
			}
		]}
endscript
