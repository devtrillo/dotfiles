let g:startify_session_dir = '~/.config/nvim/session'

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   Files']            },
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
  \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
  \ { 'type': 'commands',  'header': ['   Commands']       },
\ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ ]

let g:startify_custom_header = [
        \ '   _  __     _         __  ___         __     ___ ',
        \ '  / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
        \ ' /    / |/ / /  ` \  / /|_/ / _ `/ __/ _ \  / __/ ',
        \ '/_/|_/|___/_/_/_/_/ /_/  /_/\_,_/\__/_//_/ /____/ ',
        \]
