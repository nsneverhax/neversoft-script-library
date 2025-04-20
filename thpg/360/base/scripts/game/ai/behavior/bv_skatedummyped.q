
script RegisterBehaviors_SkateDummyPed 
	registerstate \{name = Bv_DummyPed
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = life
						state = Bv_Agent_Life
					}
				]
			}
		]}
endscript
