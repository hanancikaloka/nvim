""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN MANAGER AND PLUGIN INSTALLATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

set langmenu=en_US.UTF-8 

" ////////////////////////////////////////////////////////////////////////////
" Buffers and Search
" ////////////////////////////////////////////////////////////////////////////
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins'  }
Plug 'moll/vim-bbye'
Plug 'scrooloose/nerdtree'
Plug 'hrsh7th/nvim-cmp'
" ////////////////////////////////////////////////////////////////////////////
" Nginx PLUGIN 
" ////////////////////////////////////////////////////////////////////////////
"
Plug 'yaegassy/coc-nginx', {'do': 'yarn install --frozen-lockfile'}
Plug 'chr4/nginx.vim'

" ////////////////////////////////////////////////////////////////////////////
" Text Manipulation
" ////////////////////////////////////////////////////////////////////////////
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug '907th/vim-auto-save'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'terryma/vim-multiple-cursors'

"//////////////////////////////////////////////////////////////////////////////
"Rescript
"/////////////////////////////////////////////////////////////////////////////
Plug 'rescript-lang/vim-rescript'
autocmd FileType rescript nnoremap <silent> <buffer> <leader>r :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <leader>t :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <leader>b :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>


" Hooking up the ReScript autocomplete function
set omnifunc=rescript#Complete

" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview

" ////////////////////////////////////////////////////////////////////////////
" Golang Pluggin 
" ////////////////////////////////////////////////////////////////////////////
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ////////////////////////////////////////////////////////////////////////////
" Telescope FINDER 
" ////////////////////////////////////////////////////////////////////////////
"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Documnentation and Writing
" ////////////////////////////////////////////////////////////////////////////
Plug 'kkoomen/vim-doge'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'preservim/nerdcommenter'

" ////////////////////////////////////////////////////////////////////////////
" Status Bar and Helpers
" ////////////////////////////////////////////////////////////////////////////
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" ////////////////////////////////////////////////////////////////////////////
" Intellisense, auto completion, languages and syntax support
" ////////////////////////////////////////////////////////////////////////////
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'wavded/vim-stylus'
Plug 'jwalton512/vim-blade'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LIST OF COC EXTENSIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-docker
" coc-css
" coc-snippets
" coc-explorer
" coc-html
" coc-json
" coc-markdonwlint
" coc-phpls
" coc-tsserver
" coc-yaml
" coc-yank
" coc-vetur
" coc-highlight

" ////////////////////////////////////////////////////////////////////////////
" Color Scheme
" ////////////////////////////////////////////////////////////////////////////
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
Plug 'hardcoreplayers/oceanic-material'
Plug 'sainnhe/sonokai'
Plug 'yggdroot/indentline'
Plug 'pineapplegiant/spaceduck'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'kwsp/halcyon-neovim'
" ////////////////////////////////////////////////////////////////////////////
" Visual Helpers & Magic
" ////////////////////////////////////////////////////////////////////////////
Plug 'junegunn/vim-peekaboo'
Plug 'simeji/winresizer'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'voldikss/vim-floaterm'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/goyo.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set hidden
set number
set relativenumber
set linespace=12
set title
set tabstop=4
set shiftwidth=4
set nobackup
set ignorecase
set smartcase
set nowrap
set nowritebackup
set updatetime=300
set nobackup
set noswapfile
set showmode
set autoindent
set smartindent
set cursorline
set mouse=a
set nocompatible
set shortmess+=c
set signcolumn=yes
set redrawtime=100000
filetype plugin on
syntax on


" USE SPACE AS LEADER
let mapleader = " "
let g:mapleader = " "

" ENABLE AUTOSAVE ON VIM STARTUP
let g:auto_save = 0

" DOWN IS REALLY THE NEXT LINE
nnoremap j gj
nnoremap k gk
nnoremap J <Nop>
tnoremap <ESC>  <C-\><C-n><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD TREE CONFIG 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeChDirMode=2
nnoremap <LEADER><Tab> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPY and PASTE CONFIG 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('innamedplus')
set clipboard=unnamed,unnamedplus
endif

noremap yy "+y<cr>
noremap <LEADER>p "+gp<cr>
noremap xx "+x<cr>

if has('macunix')
vmap <c-x> :!pbcopy<cr>
vmap <c-c> :w !pbcopy<cr><cr>
endif

" OPEN SPLITS
nmap vs :vsplit<CR>
nmap sp :split<CR>

" RESIZE SPLIT
let g:winresizer_enable=1
let g:winresizer_start_key = '<C-w>r'

" QUICK MOVE SPLIT NAVIGATION
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TELESCOPE CONFIGURATION 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" BUFFERS NAVIGATIONS
map <S-Right> :bnext<CR>
map <S-Left>  :bprevious<CR>
map <S-l> :bnext<CR>
map <S-h>  :bprevious<CR>

" Quick close buffers
nmap <S-x> :Bdelete<CR>

" QUICK JUMP BUFFERS USING NUMBER
nmap <leader>b :b 
nmap <leader>qq :q<CR> 
"
" Filetype maping
let g:coc_filetype_map = {
  \ 'blade': 'html',
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors     " enable true colors support

set t_Co=256
set background=light

" for mirage version of theme
let ayucolor="dark" 

"Gruvbox settings
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_italic=1
let g:gruvbox_sign_column='bg1'

colorscheme halcyon 

"config bufferline integration with airline
let g:airline_theme='onehalfdark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL HELPERS & MAGIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

"Set no line toggle
function Noline()
	execute "set number!"
	execute "set relativenumber!"
endfunction

nmap <leader>nl :call Noline()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quick remove search highlight
nnoremap ss :noh<CR>
" Files Navigation using fzf
map <C-p> :FzfPreviewProjectFiles<CR>
map <leader>o :FzfPreviewAllBuffers<CR>
map <leader>m :Vista finder fzf:coc<CR>
map <C-f> :Rg<CR>

let g:fzf_preview_use_dev_icons = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Floaterm Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<leader>tt'
let g:floaterm_keymap_new    = '<leader>tc'
let g:floaterm_keymap_prev   = '<leader>tp'
let g:floaterm_keymap_next   = '<leader>tn'
let g:floaterm_keymap_hide   = '<leader>th'

map <leader>gg :FloatermNew lazygit<CR>
map <leader>gd :FloatermNew lazydocker<CR>

let g:floaterm_wintype = "normal"
let g:floaterm_width = 1.0
let g:floaterm_height = 0.4
let g:floaterm_autoclose = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT & vim-fugitive SHORTCUT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gs :FloatermNew lazygit<CR>
nmap <leader>gc :Gcommit -m 
nmap <leader><S-P> :Gpush<CR>
nmap <leader>gp :Gpull 
nmap <leader>gl :Glog<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>
"COC Config
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"noremap <silent><expr> <cr> pumvisible() ? coc#_coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Format Using Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Vista Vim Config
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'php': 'coc',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_setColors = 0

nmap <leader>h <Plug>vem_move_buffer_left-
nmap <leader>l <Plug>vem_move_buffer_right-
nmap <leader>p <Plug>vem_prev_buffer-
nmap <leader>n <Plug>vem_next_buffer-
