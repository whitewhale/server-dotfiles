" enable vundle
set nocompatible        " use vim rather than vi settings, must be first line
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'matchit.zip'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/yajs.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'

call vundle#end()  " required

" colors
syntax on
set background=dark
colorscheme solarized8 
set t_Co=256            " use 256 colors in terminal vim

filetype plugin indent on       " turn on filetype, filetype plugins, and filetype indent
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set hlsearch
set incsearch
set showmode        " always show what mode we're in
set nobackup		" do not keep a backup file, use versions instead
set history=1000    " a more reasonable history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set nofoldenable    " disable folding
set laststatus=2    " airline plugin requires that we always show the status line, hidden except for splits othewise
set wildmenu        " tab completion for opening files
set autowrite       " save on buffer switch
set clipboard=unnamed " enables clipboard sharing in osx

set tabstop=4       " a tab is four spaces
set shiftwidth=4    " spaces to use for autoindenting
set softtabstop=4   " when hitting <BS>, pretend like a tab is removed event if spaces
set expandtab       " expands tabs into spaces, no tab chars
set wrapscan
set autoindent		" always set autoindenting on
set smartindent     " syntax adaptive autoindenting, does not obviate the need for autoindent
"set number          " always show line numbers
set ignorecase      " ignore case when searching
set smartcase       " turns off ignore case when pattern contains uppercase letter
set visualbell      " don't beep
set noerrorbells    " don't beep

set cm=blowfish     " default encryption

set title           " display file name in osx terminal's top window bar
set hidden          " allows files in buffers to remain open
set scrolloff=3     " maintains 3 lines below cursor as cursor moved outside viewport

"set colorcolumn=120 " show column at 120 chars
let &colorcolumn=join(range(121,9999),",")
highlight ColorColumn ctermbg=236 guibg=#303030

" `a returns to line and column marked by ma, and so is more usefull.  make it
" easier to use, by swapping with '
nnoremap ' `
nnoremap ` '

let mapleader = ","
let g:mapleader = ","

" fast saves
nmap <leader>w :w!<cr>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

set pastetoggle=<leader>p

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
endif

" open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" turn off matching paren highlighting - I can't tell which one I'm on!
" let g:loaded_matchparen=1

" do not add newline chars to end of php files
autocmd FileType php setlocal noeol binary fileformat=dos

" use custom snippets, ignore defaults
" let g:snippets_dir = "~/.vim/snippets"
"
"au BufRead,BufNewFile *.scss set filetype=scss.css       " read scss as css file
"au BufRead,BufNewFile *.less set filetype=less.css       " read scss as css file
au BufRead,BufNewFile *.phtml set filetype=php
au BufNewFile,BufRead *.es6 set filetype=javascript

" simplify moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" source .vimrc
:nnoremap <Leader>sv :source $MYVIMRC<cr>

" source worklog
:nnoremap <Leader>wl :e ~/projects/worklog<cr>

" delete buffer without removing split
nmap <silent> <leader>c :bp\|bd #<CR>

"---------------------------- plugins ----------------------------"

let g:airline_theme='bubblegum'
"let g:airline#extensions#tabline#enabled = 1

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:SuperTabDefaultCompletionType = '<C-i>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" ctrlp
let g:ctrlp_map = '<C-o>'
" ignore everything .git and all directories and files in gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" pluggin mappings
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" mappings for tabularize
nmap <Leader>tb= :Tabularize /=<CR>
vmap <Leader>tb= :Tabularize /=<CR>
nmap <Leader>tb> :Tabularize /=><CR>
vmap <Leader>tb> :Tabularize /=><CR>
nmap <Leader>tb: :Tabularize /:\zs<CR>
vmap <Leader>tb: :Tabularize /:\zs<CR>

" JS Beautify
map <Leader>b :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <leader>b :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>b :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>b :call CSSBeautify()<cr>
autocmd FileType scss,less noremap <buffer> <leader>b :call CSSBeautify()<cr>

" JsDoc
map <Leader>jd :JsDoc<cr>

" Add phpDocumentor comment just above code block
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" syntastic jshint
let g:syntastic_javascript_checkers = ['jshint']
let g:jshint_highlight_color = "Red"
let g:syntastic_javascript_jshint_exec='/usr/bin/jshint'

" search recusively upwards for tags file
set tags=tags;/

" show quickfix window when there's an error
autocmd QuickFixCmdPost * nested cwindow | redraw!

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss,css,less setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
