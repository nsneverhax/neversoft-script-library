rt_version_string_main = 0
rt_version_string_os = 1
rt_version_string_build_rev = 2
rt_version_string_date = 3
rt_version_string_dongle = 4

script create_rt_version_get_string \{stringID = 0
		nameOrData = data}
	printf "create_rt_version_get_string: called with %d and %e" d = <stringID> e = <nameOrData>
	if (<nameOrData> = data)
		printf \{"create_rt_version_get_string: data"}
		GetVersionStringFromFile whichVer = <stringID> nameOrData = 1
	else
		printf \{"create_rt_version_get_string: name"}
		GetVersionStringFromFile whichVer = <stringID> nameOrData = 0
	endif
	return versionString = <verString>
endscript
