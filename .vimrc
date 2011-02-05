syntax on             " Coloration syntaxique
color inkpot

set hlsearch		" Surligne les resultats  recherche
set wrap		" retour a la ligne auto (affichage)
set showmatch		" Affiche parenthese correspondante
set autoindent		" Indentation automatique
set smartindent
filetype indent on      " activates indenting for files  
set softtabstop=4	" Largeur d'une tabulation
set shiftwidth=4	" Largeur de l'indentation
set nu			" numérotation des lignes
set autochdir		" utilise le répertoire courant comme base
set ai                  " auto indenting  
set ic                  " case insensitive search  
set scs			" smartcase: Ignore case only if search string has no Uppercase chars.
set hlsearch		" highlight what you search for  
set incsearch		" type-ahead-find  
set shiftwidth=4
set tabstop=4
set expandtab
set wildmenu      " command-line completion shows a list of matches
set wildmode=longest,list:longest,full " Bash-vim completion behavior


set laststatus=2 " Affiche la barre de status quoi qu'il en soit (0 pour la masquer, 1 pour ne l'afficher que si l'ecran est divise)
if has("statusline")
    set statusline=\ %f%m%r\ [%{strlen(&ft)?&ft:'aucun'},%{strlen(&fenc)?&fenc:&enc},%{&fileformat},ts:%{&tabstop}]%=%l,%c%V\ %P
elseif has("cmdline_info")
    set ruler " Affiche la position du curseur en bas a gauche de l'ecran
endif


if has("fname_case")
  au BufNewFile,BufRead *.lsp,*.lisp,*.el,*.cl,*.jl,*.L,.emacs,.sawfishrc,*.pddl setf lisp
else
  au BufNewFile,BufRead *.lsp,*.lisp,*.el,*.cl,*.jl,.emacs,.sawfishrc,*.pddl setf lisp
endif


" move the current line up or down
nmap <C-Down>  :m+<CR>==
nmap <C-Up> :m-2<CR>==
imap <C-Down>  <C-O>:m+<CR><C-O>==
imap <C-Up> <C-O>:m-2<CR><C-O>== 

"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

filetype plugin on
set ofu=syntaxcomplete#Complete

au BufRead,BufNewFile *.mwiki setf Wikipedia
au BufRead,BufNewFile *.wikipedia.org.* setf Wikipedia

" autocomplétion avec <TAB> plutôt que <C-n>, en fonction du contexte
function! Smart_TabComplete()
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.')+1)      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" Idem, contexte moins précis
"function InsertTabWrapper()
"      let col = col('.') - 1
"      if !col || getline('.')[col - 1] !~ '\k'
"          return "\<tab>"
"      else
"          return "\<c-x>\<c-p>"
"      endif
"endfunction
"
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>


"switch spellcheck languages
let g:myLang = 0
let g:myLangList = [ "nospell", "fr_fr", "en_gb" ]
function! MySpellLang()
    "loop through languages
    let g:myLang = g:myLang + 1
    if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
    if g:myLang == 0 | set nospell | endif
    if g:myLang == 1 | setlocal spell spelllang=fr_fr | endif
    if g:myLang == 2 | setlocal spell spelllang=en_us | endif
    echo "language:" g:myLangList[g:myLang]
endf
map <F7> :call MySpellLang()<CR>
imap <F7> <C-o>:call MySpellLang()<CR>

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" search the file for FIXME, TODO and put them in a handy list
map <F10> <Plug>TaskList

" F11 - taglist window
map <F11> :TlistToggle<cr>

" open buffers as tabs along the top or bottom of your screen
map <F12> :MiniBufExplorer<cr>

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with CTRL+F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

