enable_file_cache = 0

script CacheFiles 
	GetArraySize <cache_list>
	i = 0
	if (<array_Size> = 0)
		return
	endif
	begin
	cacheplatfile {file = (<cache_list> [<i>])}
	i = (<i> + 1)
	repeat <array_Size>
endscript

script CacheGameFiles 
	ScriptAssert \{'CacheGameFiles: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script CacheGameFilesAsync 
	CacheFiles \{cache_list = $model_skin_cache_files}
	CacheFiles \{cache_list = $model_tex_cache_files}
	CacheFiles \{cache_list = $pak_cache_files}
endscript
