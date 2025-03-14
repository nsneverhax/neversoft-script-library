enable_file_cache = 0

script cachefiles 
	getarraysize <cache_list>
	i = 0
	if (<array_size> = 0)
		return
	endif
	begin
	cacheplatfile {file = (<cache_list> [<i>])}
	i = (<i> + 1)
	repeat <array_size>
endscript

script cachegamefiles 
	if cd
		if gotparam \{force_clear}
			initfilecache \{max_files = 1024
				streambuff = 0
				size = 2048
				format}
		else
			initfilecache \{max_files = 1024
				streambuff = 0
				size = 2048}
		endif
	else
		initfilecache \{max_files = 1024
			streambuff = 0
			size = 2048
			format}
	endif
	if NOT istrue \{$enable_file_cache}
		return
	endif
	resizefilecachestreambuff (768 * 1024)
	cachefiles \{cache_list = $zone_cache_files}
	cachegamefilesasync
	if isps3
		cachefiles \{cache_list = $zone_cache_vram_files}
		cachefiles \{cache_list = $pak_cache_vram_files}
	endif
endscript

script cachegamefilesasync 
	cachefiles \{cache_list = $model_skin_cache_files}
	cachefiles \{cache_list = $model_tex_cache_files}
	cachefiles \{cache_list = $pak_cache_files}
endscript
