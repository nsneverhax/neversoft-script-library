
script scan_globaltag_downloads 

	lockglobaltags \{OFF}
	get_num_globaltag_sets
	if (<num_globaltag_sets> > 0)
		savegame = 0
		begin
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar'
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass'
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum'
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals'
		setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band'
		<savegame> = (<savegame> + 1)
		repeat (<num_globaltag_sets>)
	endif
	lockglobaltags
endscript
