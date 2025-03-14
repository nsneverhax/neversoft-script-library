
script uimessage_run 
	stars
	printf \{"UIMessage_Run"}
	printstruct <...>
	stars
	UIMessage_Enqueue <...> block_until_done = true
	printf \{"UIMessage_Run -- Message Done, Dq"}
	UIMessage_Dequeue message_id = <name>
endscript
