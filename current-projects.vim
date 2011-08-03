if !exists("g:current_projects_loaded")
    function! CurrentProjectSettings()
        let g:current_projects_loaded = 1
        if exists("*AddClassPath")
            call AddClassPath(g:home . "/swade/SwerveAndDestroy/bin/classes")
            call AddClassPath(g:home . "/swade/SwerveAndDestroy/bin/classes/com/swerveanddestroy")
            call AddClassPath(g:home . "/work/sokono_advect/target/classes")
            call AddClassPath(g:home . "/work/sokono_advect/target/test-classes")
        endif

        let g:android_logcat_filter="Swade:D *:S"
        let g:android_logcat_filter_shift="Swade:E *:S"
    endfunction
endif

call CurrentProjectSettings()
