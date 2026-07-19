enable_file_cache = 0

script CacheFiles 
	GetArraySize <cache_list>
	i = 0
	if (<array_size> = 0)
		return
	endif
	begin
	cacheplatfile {file = (<cache_list> [<i>])}
	i = (<i> + 1)
	repeat <array_size>
endscript

script CacheGameFiles 
	if CD
		if GotParam \{force_clear}
			InitFileCache \{max_files = 1024
				streambuff = 0
				size = 2048
				format}
		else
			InitFileCache \{max_files = 1024
				streambuff = 0
				size = 2048}
		endif
	else
		InitFileCache \{max_files = 1024
			streambuff = 0
			size = 2048
			format}
	endif
	if NOT IsTrue \{$enable_file_cache}
		return
	endif
	ResizeFileCacheStreamBuff (768 * 1024)
	CacheFiles \{cache_list = $zone_cache_files}
	CacheGameFilesAsync
	if IsPs3
		CacheFiles \{cache_list = $zone_cache_vram_files}
		CacheFiles \{cache_list = $pak_cache_vram_files}
	endif
endscript

script CacheGameFilesAsync 
	CacheFiles \{cache_list = $model_skin_cache_files}
	CacheFiles \{cache_list = $model_tex_cache_files}
	CacheFiles \{cache_list = $pak_cache_files}
endscript
