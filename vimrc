" -------------------------------------------------------------------------------
" Title:  .vimrc 
" Author: Jason Debauche
" -------------------------------------------------------------------------------

" Init Settings: ---------------------------------------------------------------{{{
"
" Anything that needs to go first. (Pathogen)
"
" -------------------------------------------------------------------------------

" Pathogen 
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

"                                                                               }}}
" General Settings: ------------------------------------------------------------{{{
"
" Settings that don't warrant categories to themselves. Later down the road if
" they do they get split off.
"
" -------------------------------------------------------------------------------
 
autocmd! bufwritepost .vimrc source %

syntax enable
filetype plugin indent on
filetype plugin on
set encoding=utf-8
set showcmd
set nocompatible
set ttyfast
set number
set showmode!
" Wildmenu
set wildmenu
set wildmode=list:full

" Disables warnings for hidden buffers
set hidden

" Make pasting clipboard easier
set clipboard=unnamed

" Auto change directory
" set autochdir

" Disable highlighting of matching parans
let loaded_matchparen = 1

" Don't update display when executing macros
set lazyredraw

" Hide Mouse While Typing
set mousehide

set timeoutlen=500

" Remove the characters between split windows
set fillchars="" 

" Allow cursor to go anywhere
set virtualedit=all

" Auto close NERDTree
let NERDTreeQuitOnOpen = 1

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Formatting for hidden chars
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Spell Checking
hi clear SpellBad
hi SpellBad cterm=underline
" set spell

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Open Splits to the right bottom
set splitright splitbelow

" Treat all numerals as decimal, regardless of whether they are padded with
" zeros
set nrformats=
                                               

"                                                                               }}}
" Key Mapping: -----------------------------------------------------------------{{{
"
" Keyboard Customizations. 
"
" -------------------------------------------------------------------------------

" Disable F1 Help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

imap jj <Esc>
imap kkkk <Esc>
nnoremap j gj
nnoremap k gk
noremap H ^
noremap L $
vnoremap L g_

" NERDTree Toggle
map <silent> <F4> :NERDTreeToggle<CR>

" Reselect visual selection after tabbing
vmap > >gv
vmap < <gv

" Default to more standardized regex
nnoremap / /\v
vnoremap / /\v

" Highlight toggle
nnoremap <leader><space> :noh<CR>

" Jump to matching brace
nnoremap <tab> %
vnoremap <tab> %

" Toggle list chars
nmap <leader>l :set list!<CR>

" Reformat Paragraph
nnoremap <leader>q gqip

" Reselect just pasted
nnoremap <leader>v V']

" Edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Delete to rest of the line
nnoremap D d$
map Y y$

" Don't autojump when doing * search
nnoremap * *<c-o>

" Toggle Relative Line Numbering
nnoremap <C-L> :call g:ToggleNuMode()<CR>

" Folding
nnoremap <Space> za
vnoremap <Space> za

" swap ` with ' because the ' key is closer and jumping to the character is more useful
nnoremap ' `
nnoremap ` '


"                                                                               }}}
" Spacing Settings: ------------------------------------------------------------{{{
"
" Generic space settings for typical files. More specific settings are in the 
" Filetype Settings.
"
" -------------------------------------------------------------------------------

set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set linespace=2
set nowrap
set textwidth=80
set formatoptions=qrn1
" set colorcolumn=80
execute "set colorcolumn=" . join(range(81,335), ',')

"                                                                               }}}
" GUI Settings: ----------------------------------------------------------------{{{
"
" GVIM specific settings.
"
" -------------------------------------------------------------------------------

set background=dark
colorscheme molokai-var

" Highlight line in Insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline
highlight CursorLine ctermbg=237 guibg=#293739 

" Highlight for hidden chars
highlight NonText guifg=#0f4a5a
highlight SpecialKey guifg=#0f4a5a
highlight ColorColumn ctermbg=235 guibg=#293739
highlight Visual ctermbg=237 guibg=#293739

if has('gui_running')
	"=== GUI Mode =============
	set guifont=DejaVu\ Sans\ Mono\ 12
	set lsp=3

	" Turn off Toolbar
	set guioptions-=T 
	" set guioptions-=m

	" Turn off Scrollbar
	set guioptions+=LlRrb
	set guioptions-=LlRrb

else
	"=== Terminal Mode =======
	set mouse=a
endif 

"                                                                               }}}
" Filetype Settings: -----------------------------------------------------------{{{
"
" Custom settings for specific filetypes. 
"
" -------------------------------------------------------------------------------

" Filetypes:
" VIM {{{
autocmd FileType vim setlocal foldmethod=marker
" }}} 
" HTML {{{
autocmd FileType html set shiftwidth=2
autocmd FileType html set tabstop=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
autocmd FileType html setlocal foldmethod=indent
autocmd BufRead *.html set ft=html.css.javascript
autocmd BufNewFile *.html set ft=html.css.javascript
" }}} 
" CSS {{{
autocmd FileType css set shiftwidth=2
autocmd FileType css set tabstop=2
autocmd FileType css set sts=2
autocmd FileType css setlocal fdm=marker fmr={,} 
" }}} 
" PHP {{{
autocmd BufRead *.php set ft=php.html.css
autocmd BufNewFile *.php set ft=php.html.css
autocmd FileType php setlocal foldmethod=syntax
let php_folding = 1
" }}} 
" JS {{{
autocmd BufRead *.js set ft=javascript.javascript-jquery
autocmd BufNewFile *.js set ft=javascript.javascript-jquery
autocmd FileType js setlocal foldmethod=syntax
let javaScript_fold = 1
" }}} 
" SH {{{
autocmd BufRead *.sh set ft=zsh
autocmd BufNewFile *.sh set ft=zsh
autocmd FileType sh setlocal foldmethod=syntax
let sh_fold_enabled=1
" }}} 
" Python {{{
autocmd FileType py set shiftwidth=4
autocmd FileType py set tabstop=4
autocmd FileType py set expandtab
autocmd FileType py set autoindent
autocmd FileType py set fdm=indent
autocmd FileType py set foldlevelstart=99
autocmd FileType py set fdi="#"
autocmd BufRead *.py set ft=python
autocmd BufNewFile *.py set ft=python

" Wrap at 72 chars for comments.
" }}} 

"                                                                               }}}
" Save Settings: ---------------------------------------------------------------{{{
"
" Backup, Swap, and Undo Settings. 
"
" -------------------------------------------------------------------------------

set nobackup
set noswapfile

"                                                                               }}}
" Search Settings: -------------------------------------------------------------{{{
"
" Customizations on how searching works. 
"
" -------------------------------------------------------------------------------

set hlsearch
set incsearch
set ignorecase
set smartcase

" Make %s replace global by default
set gdefault
"
" Briefly jump to matching bracket 
" showmatch

"                                                                               }}}
" Statusline Config: -----------------------------------------------------------{{{
"
" Tweaks to the status bar.
"
" -------------------------------------------------------------------------------

" Always show statusbar
set laststatus=2
" 
" " THE WHITESPACE IS IMPORTANT!
" set statusline=%<\ 
" " Flags and buffer Number
" set statusline+=%2*[%n%H%M%R%W]%*\ 
" " Filename
" set statusline+=%f\ 
" " PWD
" set statusline+=[%{getcwd()}]\  
" " Filetype
" set statusline+=[%{strlen(&ft)?&ft:'none'}, 
" " Encoding
" set statusline+=%{strlen(&fenc)?&fenc:&enc}] 
" " Right Align
" set statusline+=%= 
" " Highlight
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ 
" " Current char
" set statusline+=%b,0x%-8B\ 
" " Offset
" set statusline+=%-14.(%l,%c%V%)\ %<%P%<\ 

" Powerline Config
" let g:Powerline_theme='skwp'
" let g:Powerline_colorscheme='skwp'
" let g:Powerline_symbols='compatible'

"                                                                               }}}
" Functions: -------------------------------------------------------------------{{{
"
" Extra functionality. :)
"
" -------------------------------------------------------------------------------
function! g:ToggleNuMode() " {{{
	if(&rnu == 1)
		set nornu
	else
		set rnu
	endif
endfunc " }}}
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction 

set foldtext=MyFoldText() " }}}

"                                                                               }}}
" Abbreviations: ---------------------------------------------------------------{{{
"
" Words that I tend to mispell a lot.
"
" -------------------------------------------------------------------------------

iab Teh The
iab teh the
iab hte the
iab Taht That
iab taht taht
iab od do
iab ot to
iab era are
iab aer are
iab rea are
iab recieved received
iab si is
iab guarentee guarantee
iab guarenteed guaranteed
"                                                                               }}}
" Plugin Config: ---------------------------------------------------------------{{{
"
" Configurations for installed Plugins
"
" -------------------------------------------------------------------------------

" Python-Mode

" Enable python folding
" let g:pymode_folding = 1
"
" let g:pydiction_location = '~.vim/bundle/pydiction/complete-dict'
" let g:pydiction_menu_height = 20
"                                                                               }}}
