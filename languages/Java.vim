if !exists("g:java_editing_init_done")
    let g:java_editing_init_done = 1

    " Java vim config "
    map <C-\> <ESC>:pop<CR>

    " Vim JDE "
    setlocal cfu=VjdeCompletionFun
    let g:vjde_lib_path=g:home."/.android/platforms/android-11/android.jar"

    fun! AddClassPath(classpath)
        let g:vjde_lib_path=g:vjde_lib_path . ":" . a:classpath
    endfun


    " For android, using ant "
    fun! AntMake()
        if system("which adb") == g:home . "/.android/platform-tools/adb\n"
            set makeprg=ant\ -emacs\ install
        else
            set makeprg=ant\ build
        endif
        make
    endfun

    fun! AndroidRun()
        echo system("adb shell 'am start -n com.swerveanddestroy/.SwerveAndDestroy'")
    endfun

    " For maven "
    fun! MvnMake()
        set makeprg=mvn\ test
        set errorformat=
                    \%-G[%\\(WARNING]%\\)%\\@!%.%#,
                    \%A%[%^[]%\\@=%f:[%l\\,%v]\ %m,
                    \%W[WARNING]\ %f:[%l\\,%v]\ %m,
                    \%-Z\ %#,
                    \%-Clocation\ %#:%.%#,
                    \%C%[%^:]%#%m,
                    \%-G%.%#
        make
    endfun

    map <F5> :call AntMake()<CR>
    map <S-F5> :call MvnMake()<CR>
    map <C-F5> :call AndroidRun()<CR>
    imap <F5> <ESC>:call AntMake()<CR>
    imap <S-F5> <ESC>:call MvnMake()<CR>
    imap <C-F5> <ESC>:call AndroidRun()<CR>

    map <F6> :cn<CR>
    map <S-F6> :cp<CR>
    imap <F6> <ESC>:cn<CR>
    imap <S-F6> <ESC>:cp<CR>

    exec("source " . g:home . "/.vim/current-projects.vim")

    " Logcat 
    map <F7> :exec("!adb logcat '" . g:android_logcat_filter ."'")<CR>
    map <S-F7> :exec("!adb logcat '" . g:android_logcat_filter_shift . "'")<CR>
endif

" Allow delimitMate to add padding for braces "
let b:delimitMate_expand_cr=1
