" Vim Is Like a Language
" Think in Vim 이다. 언어는 생각이다.
"한줄 명령의 실행과 영역설정의 실행을 나타냄!  
"Fun = serious work is made quick! 펀!
	nnoremap <c-\> :exe getline(".")<CR>
" vnoremap <F2> :<C-w>exe join(getline("'<","'>"), '<Bar>')<CR>
	vnoremap <c-\> "cy:<c-u>exe getreg("c")<cr>
"주석문comment  ls | echo "hello" | !say hello "주석문comment
autocmd FileType wiki set filetype=markdown

au BufNewFile,BufRead *.wiki set filetype=markdown


set runtimepath+=~/.vim_runtime

	"source ~/.vim_runtime/vimrcs/basic.vim
	"source ~/.vim_runtime/vimrcs/filetypes.vim
	"source ~/.vim_runtime/vimrcs/plugins_config.vim
	"source ~/.vim_runtime/vimrcs/extended.vim
"목표를 나누어서 하나씩 처리할 것
"source ~/LJP_config/vimrc_LJP/my_plugin_config.vim
	source ~/LJP_config/vimrc_LJP/my_plugin_config_PluginInstaller.vim
  if &compatible
	set nocompatible              " be iMproved, required
end

filetype off                  " required

" ~/LJP_config/vimrc_LJP/my_plugin_config_PluginInstaller.vim
" ~/LJP_config/vimrc_LJP/my_plugin_inbox1.vim
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

	Plugin 'VundleVim/Vundle.vim'


" [2] File tree viewer
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-commentary'
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	Plugin 'garbas/vim-snipmate'

 " Optional:
	Plugin 'honza/vim-snippets'
" [3] Search 검색 
	Plugin 'mileszs/ack.vim' "검색의 :Ack
	Plugin 'ctrlpvim/ctrlp.vim' "search ctrl+p

	"검색의 명령어 모음
	":vimgrep /grep/ *.wiki
	":copen :cclose
	":Ack shell
	":Ack "C-R"
	":r!ls %:p
	":put b 는 <C-r> b와 같다!	:let @b=expand('%:p')
	":redir @b |:ls|:redir END| put b 
	":redir @b |ls|redir END| put b 
	"
" The sparkup vim script is in a subdirectory of this repo called vim.

" Pass the path to set the runtimepath properly.
	" Plugin 'vim-pandoc/vim-pandoc'
	" Plugin 'vim-pandoc/vim-pandoc-syntax'
	Plugin 'vimwiki/vimwiki'
	Plugin 'mattn/calendar-vim'
	Plugin 'suan/instant-markdown-d'
	Plugin 'suan/vim-instant-markdown'
	" Plugin 'etnadji/vim-epub'
"Plugin 
	Plugin 'christoomey/vim-tmux-navigator'
	Plugin 'christoomey/vim-tmux-runner'
	Plugin 'pangloss/vim-javascript'
	Plugin 'davidhalter/jedi-vim' "Python autocompletion with VIM

" /Users/Leejeongpyo/LJP_config/vimrc_LJP/my_plugin_config_pomodoro.vim



"실행은 :PluginInstall
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on  


if executable('ag')
	  let g:ackprg = 'ag --vimgrep'
  endif

	source ~/LJP_config/vimrc_LJP/my_configpart_no_key.vim "화살표 del키를 무력화
  set mouse=a "http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
" > vim my_configpart_no_key
"ino <BS> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>


	source ~/LJP_config/vimrc_LJP/my_plugin_using_tmuxnavigator.vim "사용한다. tmuxnavigator
	source ~/LJP_config/vimrc_LJP/my_configpart_iterm2.vim " personal화 
	
	" source ~/LJP_config/vimrc_LJP/my_configpart_korean.vim " 한글화향해!
	nnoremap j gj
	nnoremap k gk
	"nnoremap W B
	"nnoremap E gE
	

try
"삭제를 예단함s0*ource ~/.vim_runtime/my_configs.vim
catch
endtry

source ~/LJP_config/vimrc_LJP/my_plugin_inbox1.vim "나중에 체계적인 정리가 요망된다. 일단저장함기본
"""""""""""""""""""""""""""""""""""""""""
"
"이곳의 내용을 사용해 보고 나중에 분류법에
"맞게 정리하고 파일로 나누어서 loading하며
"관리할 것
" ~/LJP_config/vimrc_LJP/my_plugin_inbox1.vim
" ~/LJP_config/vimrc_LJP/my_plugin_config_PluginInstaller.vim
"
"""""""""""""""""""""""""""""""""""""""""


"setlocal buftype=nofile
setlocal bufhidden=hide
"setlocal noswapfile
set noswapfile
set nobackup 
set nowritebackup 
set visualbell "벨소리안나게
noremap <silent><Esc> :nohlsearch<CR>
set nu
set rnu
set cursorline " 활성 줄에 표시하기
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"set autowrite " Automatically :write before running commands
"set autoread " Reload files changed outside vim
"
"
set ignorecase " case insensitive searching (unless specified)


set splitbelow
set splitright



set noswapfile
"~/.tmux.conf # tmux config file
"
"
"

let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:instant_markdonw_autostart = 1
""""""
" vimwiki - Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on
syntax on
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>


"Powerline vim .file
"set rtp+=/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/powerline/bindings/vim/
"set rtp+=/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/powerline/bindings/vim/plugin/
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set hlsearch "set nohls

"nnoremap ,b :ls<CR>:buffer<Space>
"nnoremap ,t :tabs<CR>:tabn<Space>
nnoremap ,t :ls<CR>:tabs<CR>:bmod<Space> \"2,$bd나_tabn_vert_sb를_실행할_수_있음
command Bd bp\|bd \#

"===========================================
" 시작시 열어둘버퍼목록을 설정함 1. index.wiki 2. DiaryList.wiki
" edit +74 ~/vimwiki/index.wiki
" edit +24 ~/vimwiki/diary/DiaryList2Do.wiki
" e ~/vimwiki/diary/diary.wiki | normal! 22G3j
" e $MYVIMRC | normal! 65Gzz70G
" e ~/vimwiki/diary/DiaryList.wiki | :normal! 19G17G$3h

let @1='edit +74 ~/vimwiki/index.wiki'
let @2='edit +24 ~/vimwiki/diary/DiaryList2Do.wiki'
let @3='e ~/vimwiki/diary/diary.wiki | normal! 22G3j'
let @4='e $MYVIMRC | normal! 65Gzz70G'
let @5='e ~/vimwiki/diary/DiaryList.wiki | :normal! 19G17G$3h'
" 녹화의 실행아이디어쪼끔 - :edit +74 ~/vimwiki/index.wiki
"
let @"=':edit +74 ~/vimwiki/index.wiki^Medit +24 ~/vimwiki/diary/DiaryList2Do.wiki^Me ~/vimwiki/diary/diary.wiki | normal! 22G3j^Me $MYVIMRC | normal! 65Gzz70G^Me ~/vimwiki/diary/DiaryList.wiki | :normal! 19G17G$3h^M'
let @q=' :e! 
'
let @e='gt:e!
'
"bufdo normal @q
"gt:e!
"머글과 위저드의 차이를 기술한 동영상참조함24:00
bufdo tab split "수행후 syntax를 파괴하는 성향이 있는 것 같음
"tab sba "패널을 모두 탭으로 전환" 모든 버퍼를 호출: :vert sba 다음에 실행함
"===========================================
normal! 6@e

"================================================================== 
"기능들을 임시로 주어온다.
" Set 7 lines to the cursor - when moving vertically using j/k
set so=5 "원래는 7의값, 매우 편리한 주의 자동정렬기능임 강력사용권고
" Set to auto read when a file is changed from the outside
set autoread "자동으로 읽어내는지를 아이탬2와 연동하여 검증필요
"Always show current position
set ruler "위치좌표와 퍼센트를 나타냄 필수적인 등록!

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" let mapleader = ","
" let g:mapleader = ","

" Fast saving
" nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


" Turn on the WiLd menu
set wildmenu "뭐지?

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr> "현재탭을 현재로 알림을 실행함!! "현재폴더는:추가요망"

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

"""""""""""""""""""""""""""""""""""""""""
"매우 특이함 포커스상실이 바로저장
"au FocusLost,WinLeave * :silent! wa
"
"" update dir to current file
"autocmd BufEnter * silent! cd %:p:h
""버퍼의 위치로 자동으로 현재 폴더위치를 정함
autocmd BufEnter * lcd %:p:h | echo "현재폴더의 위치:".expand('%:p:h')
" :echo strftime('%c') . ' => ' . expand('%')  : change to directory of current file automatically (put in _vimrc)
	"set statusline+=%F "파일명을 설정하는 것 같음 airline 등과 비교해
	"볼것
	"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
	"nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
""""""""""""""""""""""""""""""""""""""""""



" Format the status line
"      set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1
""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
" map 0 ^ "만일 $를 g_로 변경할 아이디어를 얻음.
"


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif



 map <leader>x :vert sb ~/vimwiki/index.wiki<cr>
" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>

" Returns true if paste mode is enabled
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Returns true if paste mode is enabled
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     endif
"     return ''
" endfunction

" Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" set expandtab "스페이스키들로 탭을 변경함
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


