call plug#begin('~/.vim/plugged')

" Themes
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'joshdick/onedark.vim'
Plug 'romainl/Apprentice'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit'
        \ }
nnoremap <c-p> :FZF<cr>
augroup fzf
        autocmd!
        autocmd! FileType fzf
        autocmd  FileType fzf set laststatus=0 noshowmode noruler
                \ | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" On-demand loading: :NERDTreeToggle
" NERDTree will be loaded on the first invocation of the NERDTreeToggle
" command
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Gutentags
Plug 'ludovicchabant/vim-gutentags'
"let g:gutentags_trace = 1

" Tagbar
Plug 'majutsushi/tagbar'

" YouCompleteMe
Plug 'valloric/youcompleteme'
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Make YouCompleteMe use ctags as well
let g:ycm_collect_identifiers_from_tag_files = 1
" Stop YouCompleteMe from asking questions at startup
let g:ycm_confirm_extra_conf = 0
" Code navigation with Ctrl-] , use Ctrl-O to get back to previous location
nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>

" Statusline
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#searchcount#enabled = 0
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#tagbar#flags = 'f'
let g:airline_powerline_fonts = 1

function! AirlineInit()
    let g:airline_section_a = airline#section#create_left(['crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Forked from google/vim-searchindex, has a patch that improves the remappings
" of '#', '*', 'N' and 'n' per my personal preference
Plug 'zijiax/vim-searchindex'

" :FixWhitespace
"Plug 'bronson/vim-trailing-whitespace'

call plug#end()

"colorscheme apprentice
"colorscheme onedark
colorscheme palenight

if &diff
        colorscheme apprentice
endif

" Don't wrap long lines
set nowrap
" Show a better line wrap
set showbreak=↪

set sidescroll=1

" Display line numbers
set number

" Show current mode
set showmode

" Highlight current line
set cursorline

" To ALWAYS use the clipboard for ALL operations (instead of
" interacting with the '+' and/or '*' registers explicitly)
set clipboard+=unnamed

" Tab and indent related
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" If a pattern contains an uppercase letter, it is case sensitive,
" otherwise, it is not
set ignorecase
set smartcase

set hlsearch
" Don't move the cursor to the matched string
set noincsearch
" Don't show search count message when searching
set shortmess+=S

" Turn hybrid line numbers on
set nu rnu
set number relativenumber

set wildignore+=*/tmp/*,*.so,*.swp

syntax on

" Search mappings: These will make it so that going to the next one
" in a search will center on the line it's found in
"nnoremap * *zz
"nnoremap N Nzz
"nnoremap n nzz

" For iTerm2 in macOS, change cursor shape in different modes
"let &t_SI = \"\<Esc>]50;CursorShape=1\x7"
"let &t_SR = \"\<Esc>]50;CursorShape=2\x7"
"let &t_EI = \"\<Esc>]50;CursorShape=0\x7"

" For Windows Terminal in Windows, change cursor shape in different modes
if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[3 q"
  " solid block
  let &t_EI .= "\<Esc>[1 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

