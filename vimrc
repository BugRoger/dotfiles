"setup pathogen
filetype off
let g:pathogen_disabled = []

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

"gets rid of all the crap that Vim does to be vi compatible
set nocompatible

"prevents some security exploits having to do with modelines
set modelines=0

"tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"a few options that just make things better
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set nofoldenable

"move swp and backup files out of sight
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.

"change leader away from \
let mapleader = ","

"a few options that just make things better
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"makes Vim handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"force arrow keys off
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"Use the arrows to something usefull
map <right> :bnext<CR>
map <left> :bprevious<CR>
map <up> :BD<CR>

"get rid of that stupid goddamned help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"save on losing focus
au FocusLost * :wa

"Color scheme (terminal)
syntax on
colorscheme molokai
set guifont=Menlo\ for\ Powerline:h12

"Gui Options
set guioptions=e-t

"Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"NERDTree Helpers
nmap <Leader>n :NERDTreeToggle<CR>

"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
endif

"Retab shortcut
nmap <Leader>r :%retab<CR>

" Markdown preview
imap <leader>m <ESC>:w!<CR>:!markdown % > %.html && open %.html<CR><CR>a
map  <leader>m <ESC>:w!<CR>:!markdown % > %.html && open %.html<CR><CR>a

 
"Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Ruby support
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

"JSON support
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd FileType json set equalprg=json_reformat
  
"Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_disabled_filetypes = ['cucumber']

"Powerline
let g:Powerline_symbols = 'fancy'

"statusline setup
"set statusline=
"set statusline+=[%n]\          "Buffer Number
"set statusline+=%<             "truncate at the beginning of the line
"set statusline+=%f\            "path to file as typed or relative to current dir
"set statusline+=%y             "filetype
"set statusline+=%h%m%r         "flags: help, modified, readonly
"set statusline+=%=             "seperator
"set statusline+=%-14.(%l,%c%V%) "line,column
"set statusline+=\ %P           "Percentage through file

runtime macros/matchit.vim

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
              \ 'backup': 'backupdir', 
              \ 'views': 'viewdir', 
              \ 'swap': 'directory' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)

              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction
call InitializeDirectories() 
