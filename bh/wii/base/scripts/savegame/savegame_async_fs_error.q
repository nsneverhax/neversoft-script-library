
script savegame_async_fs_error_start_logic 
	if GotParam \{error}
		Change savegame_async_fs_last_error = <error>
	else
		get_savegame_from_controller controller = <device_num>
	endif
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	Change \{MemcardDoneScript = savegame_async_fs_error_done}
	Change \{MemcardRetryScript = savegame_async_fs_error_start_logic}
	Change \{MemcardSuccess = FALSE}
	Change memcardcontroller = <savegame>
	Change \{memcardsigningin = FALSE}
	Change \{memcardjamordefault = Default}
	memcard_error error = ($savegame_async_fs_last_error)
endscript

script savegame_async_fs_error_done 
	memcard_cleanup_messages
endscript
