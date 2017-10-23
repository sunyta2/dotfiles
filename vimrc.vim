""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Is Like a Language
" Think in Vim 이다. 언어는 생각이다.
"한줄 명령의 실행과 영역설정의 실행을 나타냄!  
"Fun = serious work is made quick! 펀!
""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-l> <Right>
" BASIC 설정 settings
if executable('ag')
	  let g:ackprg = 'ag --vimgrep'
  endif
set ignorecase " case insensitive searching (unless specified)
set hlsearch "set nohls
 noremap <silent><Esc> :nohlsearch<CR>
" Show matching brackets when text indicator is over them
set showmatch 
" 드디어 발견한 최고의 클립보드의 해결책 yank.wiki를 참조할 것
" status line setting testing
" :set statusline=%f         " Path to the file
" 드디어 발견한 최고의 클립보드의 해결책 yank.wiki를 참조할 것
set clipboard=unnamed


"setlocal buftype=nofile
setlocal bufhidden=hide
set noswapfile "setlocal noswapfile
set nobackup 
set nowritebackup 


set nu! rnu!
set cursorline " 활성 줄에 표시하기
set laststatus=2
set t_Co=256
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

			set splitbelow
			set splitright
		map <leader>l :bnext<cr>
		map <leader>h :bprevious<cr>

set so=5 "매우 강력사용권고 Set 7 lines moving vertically using j/k
set ruler "위치좌표와 퍼센트를 나타냄 필수적인 등록!  "Always show current position
set cmdheight=2				 " Height of the command bar
" set hid " A buffer becomes hidden when it is abandoned
	" 위의 정보에서 힌트! <c-w>q나 <c-w>c 중에서 그냥 buffer삭제를 담당하게 하면 편리하지 않을까?
" Format the status line
"      set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c



" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" => Text, tab and indent related
set tm=500

" foloing설정임 나중에 folding.wiki를 참조할 것
" mkview를 실행하여 저장할 것
" How many tenths of a second to blink when matching brackets
set mat=2
set wildmenu "뭐지?  " Turn on the WiLd menu


set autoread "자동으로 읽어내는지를 아이탬2와 연동하여 검증필요 " Set to auto read when a file is changed from the outside
"set autoread " Reload files changed outside vim
"set autowrite " Automatically :write before running commands

"bufdo tab split "수행후 syntax를 파괴하는 성향이 있는 것 같음
":vert sba » :tab sba "패널을 모두 탭으로 전환" 모든 버퍼를 호출:  다음에 실행함
nmap <silent> <F5> :set list!<CR>
set listchars=tab:⇥\ ,eol:↩︎	 "	#  ‣⇥⏎↩︎

" session management
let g:session_directory = "~/.tmuxinator/"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR> 
nnoremap <leader>sc :CloseSession<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim_runtime
" Bundle의 관리자 Vundle.vim
if &compatible
	set nocompatible              " be iMproved, required
end
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin() " 플러그인 번들에 관하여
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

	Plugin 'VundleVim/Vundle.vim'


Plugin 'Valloric/YouCompleteMe' "자동완성기능을 살피려고 시도함

" Track the engine.
Plugin 'SirVer/ultisnips'
	Plugin 'ervandew/supertab'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"




	Plugin 'junegunn/fzf.vim'
	Plugin 'junegunn/fzf'
" Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'jlanzarotta/bufexplorer'
" [2] File tree viewer
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-surround'
	Plugin 'jiangmiao/auto-pairs' "유용한 자동설정의 패어링
	Plugin 'tpope/vim-commentary'
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	" Plugin 'garbas/vim-snipmate'

 " Optional:
	" Plugin 'honza/vim-snippets'

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
	" Plugin 'suan/instant-markdown-d'
	" Plugin 'suan/vim-instant-markdown'
	" Plugin 'etnadji/vim-epub'
"Plugin 
	Plugin 'xolox/vim-session'
	Plugin 'xolox/vim-misc'

	Plugin 'christoomey/vim-tmux-navigator'
	Plugin 'christoomey/vim-tmux-runner'
	Plugin 'pangloss/vim-javascript'
	Plugin 'davidhalter/jedi-vim' "Python autocompletion with VIM

" /Users/Leejeongpyo/LJP_config/vimrc_LJP/my_plugin_config_pomodoro.vim



"실행은 :PluginInstall
" All of your Plugins must be added before the following line
"
"
" vim airline을 powerline의 임시대용으로 설치함
" Plugin 'bling/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
"
""""""""""""""""""""""""""""""""""""""""""""""""""""

" 나의 실험실 -실험적 플러그인과 mapping 설정실험 실행을 실시함.

	" source ~/LJP_config/vimrc_LJP/my_plugin_inbox1.vim 
		" 주로 비어있고 플러그인 실험용으로 활성화 해 볼것 
		"e $MYVIMRC 
		" so ~/.vimrc_test.vim
		"tabe ~/.vimrc_test.vim
	"mapping 설정실험 실행을 실시
"nnoremap ,b :ls<CR>:buffer<Space>
"nnoremap ,t :tabs<CR>:tabn<Space>
nnoremap ,t :ls<CR>:tabs<CR>:bmod<Space> \"2,$bd나_tabn_vert_sb를_실행할_수_있음
"command Bd bp\|bd \#
filetype plugin indent on  




		" nmap <leader>w :w!<cr> " Fast saving
		" With a map leader it's possible to do extra key combinations
		" like <leader>w saves the current file
		" let mapleader = ","
		" let g:mapleader = ","

		" :W sudo saves the file 
		" (useful for handling the permission-denied error)
		" command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au BufNewFile,BufRead *.vimrc .wiki set filetype " Syntax

" .vimrc 파일
autocmd BufWinEnter .vimrc silent loadview

		" au BufWinEnter *.c silent loadview
		"
		"
" autocmd FileType wiki set filetype=markdown
" au BufNewFile,BufRead *.wiki set filetype=markdown
au BufRead,BufNewFile *.scpt set filetype=applescript
au BufRead,BufNewFile *.applescript set filetype=applescript
autocmd FileType wiki set filetype=vimwiki
au BufNewFile,BufRead *.wiki set filetype=vimwiki

""""""""""""""""""""""""""""""""""""""""""

"화살표 del키를 무력화	source ~/LJP_config/vimrc_LJP/my_configpart_no_key.vim 
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


	"사용한다. tmuxnavigator source ~/LJP_config/vimrc_LJP/my_plugin_using_tmuxnavigator.vim 

"이것은 http://www.github.com/christoomey/vim-tmux-navigator

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\\> :TmuxNavigatePrevious<cr>https://


""""""""""""""""""""""""""""""""""""""""""""""""""""
" status line setting - 라인공부1
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe
 " set statusline  =[b
 " set statusline +=%n            "buffer number
 " set statusline +=]\ \ 
 " set statusline +=\ %<%F            "full path
 
 " set statusline +=%=
 " set statusline +=%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\   " Switch to the right side
 " set statusline +=\ %5l             "current line
 " set statusline +=\ [%b]				"char_number
 " set statusline +=\ /%L               "total lines

" set statusline=%{v:register}%<%m

"원형애 색을 넣기전 set statusline=[b%n%M]%{getcwd()}/%f\ \[%Y:%{&fenc}:%{&ff}]%m\ %=(%b)reg\ %{v:register}\ %l\/%L\ %P[%{strftime('%a\ %b\ %d\ %I:%M%p')}\]\ %m
set statusline=[%2*b%n%*%1*%M%*]%{getcwd()}/%f\ \[%Y:%{&fenc}:%{&ff}]%1*%m%*\ %=(%b)reg\ %9*%{v:register}%*\ %l\/%L\ %3*%P%*[%{strftime('%a\ %b\ %d\ %I:%M%p')}\]\ %1*%m%r%w%*
" 타겟의 원조 set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]\ %=\ Line:%l\/%L\ Column:%c%V\ %P 
" 타겟의 원조2 set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P    " 매우 간결하고 원형의 레지스터기능!
" 타겟의 1part set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ \[%{strftime('%a/%b/%d\ %I:%M%p')}\]\ %=\ %l\/%L\ %P 


"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
"set rulerformat+=%4*\ %<%F%*            "full path
" set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor
" 드디어 발견한 최고의 시계 time 의 해결책 vimwiki/status_line.wiki를 참조할 것
" :set statusline+=\ -\      " Separator
" :set statusline+=FileType: " Label
" :set statusline+=%y        " Filetype of the file
" [A more useful statusline in vim? - Stack Overflow](https://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim/5380230)




""""""""""""""""""""""""""""""""""""""""""""""""""""
" focus status & infomation alarm "Powerline vim .file
"set rtp+=/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/powerline/bindings/vim/
"set rtp+=/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/powerline/bindings/vim/plugin/
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr> "현재탭을 현재로 알림을 실행함!! "현재폴더는:추가요망"

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"""""""""""""""""""""""""""""""""""""""""
"매우 특이함 포커스상실이 바로저장-현재불활성화시킴
"이유는 강제저장이 불용성의 이유로!
"au FocusLost,WinLeave * :silent! wa
"
"" update dir to current file
"autocmd BufEnter * silent! cd %:p:h
""버퍼의 위치로 자동으로 현재 폴더위치를 정함
" autocmd TabEnter echo "현재의 위치:".expand('%:p')
" autocmd TabEnter exe "normal! 1<C-g>"
autocmd BufEnter * lcd %:p:h | echo "현재의 위치:".expand('%:p')
" :echo strftime('%c') . ' => ' . expand('%')  : change to directory of current file automatically (put in _vimrc)
	"set statusline+=%F "파일명을 설정하는 것 같음 airline 등과 비교해
	"볼것
	"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
	"nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree & Bufexplorer & Ctrl-p 의 사용
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used
let NERDTreeShowLineNumbers=1 " enable line numbers

map <leader>nn :NERDTreeFind<CR>
" Bufexplorer \bv \be \bs " ~/vimwiki/bufexplorer.wiki

" Ctrl-p " ~/vimwiki/ctrlp.wiki


""""""
" vimwiki - Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on
syntax on
" vimwiki with markdown support
" let g:vimwiki_ext2syntax = {'.md': 'markdown'}
" let g:instant_markdonw_autostart = 1
" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" help page -> :h vimwiki-syntax 
" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>

""""""""""""""""""""""""""""""""""""""""""
" vimwiki list 설정임
let g:vimwiki_folding='list'

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
"let wiki_1.html_template = '/Volumes/BackUp(SSD)/hwa_org_html/template.tpl'
"let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_2 = {}
let wiki_2.path = '/Volumes/BackUp(SSD)/hwa_org'

" let wiki_2 = {}
" let wiki_2.path = '~/project_docs/'
" let wiki_2.index = 'main'
let wiki_3 = {}
let wiki_3.path = '/Users/Leejeongpyo/test'

let wiki_4 = {}
let wiki_4.path = '/Volumes/Data-SSD/SYN4_Book'
                                                                
let g:vimwiki_list = [wiki_1
						\, wiki_2
						\, wiki_3
						\, wiki_4
									\ ]
						" 이후에 라틴어, 희랍어, 학습노트 추가도 고려할 것,
						" \, wiki_5

" 1<Leader>wt as above tabopens the first wiki from |g:vimwiki_list|.
" 2<Leader>wt tabopens the second wiki from |g:vimwiki_list|.
" 3<Leader>wt tabopens the third wiki from |g:vimwiki_list|.
 map <leader>x :vert sb ~/vimwiki/index.wiki<cr>
 " Quickly open a markdown buffer for scribble
 " map <leader>x :e ~/buffer.md<cr>
 
        "autocmd BufAdd * exe "cd" fnameescape(getcwd())
autocmd BufAdd *.wiki silent loadview
"winenter과 bufAdd의 차이는 윈도우실행과 버퍼로 불러들이는 것인지 실험이 필요함.
"뒤에 exe를 넣는 것이 나은 것인가?
" 4
"
"""""""""""""""""""""""""""""""""""
" No annoying sound on errors "벨소리안나게
set noerrorbells
set visualbell "벨소리안나게
set t_vb=
autocmd! GUIEnter * set vb t_vb=



"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" vim_snippets 연습 !!!



" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
"  "[UltiSnips, YouCompleteMe; Now if You Two Can Just Get Along](http://chauncey.io/ultisnips-youcompleteme-now-if-i-can-just-get-you-two-to-cooperate/)
" " better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger="<cr>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"""""     """""     """""     """""
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

"""""""""""""""""""""""""""""""""""
" function! g:UltiSnips_Complete()
"     call UltiSnips_ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips_JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction

" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
""""""     """"""      """"""""""""
"[Expand UltiSnips snippet if expand key invoked after UltiSnips trigger string · Issue #420 · Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe/issues/420)
" func! g:jInYCM()
"     if pumvisible()
"         return "\<C-n>"
"     else
"         return "\<c-j>"
" endfunction

" func! g:kInYCM()
"     if pumvisible()
"         return "\<C-p>"
"     else
"         return "\<c-k>"
" endfunction
" inoremap <c-j> <c-r>=g:jInYCM()<cr>
" au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:kInYCM()<cr>"
" let g:UltiSnipsJumpBackwordTrigger = "<c-k>"



"""""""""""""""""""""""""""""""""""
" ycm에 밀려서 보류할 것
" imap <M-Tab> <Plug>snipMateNextOrTrigger
" imap <C-r>` <Plug>snipMateNextOrTrigger

" [[snippets]] 참조할 것.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim 키설정
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


"""""""""""""""""""""""""""""""""""
" TODO 별도의 확장법으로 전개하는 방식을 연구할 필요가 있음
	" iTerm의 개별설정법
	"source ~/LJP_config/vimrc_LJP/my_configpart_iterm2.vim " personal화 
		if exists('$ITERM_PROFILE')
		colorscheme torte
		  if exists('$TMUX')
			let &t_SI = "\<Esc>[3 q"
			let &t_EI = "\<Esc>[0 q"
		  else
			let &t_SI = "\<Esc>]50;CursorShape=1\x7"
			let &t_EI = "\<Esc>]50;CursorShape=0\x7"
		  endif
		end
" 별도의 확장법으로 전개하는 방식을 연구할 필요가 있음
" 예컨데 if 성립시 별도의 파일로 실행하도록 공통, 2갈래의 길의제시함
" neovim의 경우에도 동일하게 설정을 갈라놓을 수 있지 않을까?
	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	" source ~/LJP_config/vimrc_LJP/my_configpart_korean.vim " 한글화향해!
""""""""""""""""""""""""""""""""""""""""""
" Toggle 기능설정법 with function

""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>


" Remap VIM 0 to first non-blank character
" map 0 ^ "만일 $를 g_로 변경할 아이디어를 얻음.
"
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
" try Function 시도하는 것
try
"삭제를 예단함s0*ource ~/.vim_runtime/my_configs.vim
catch
endtry

""""""""""""""""""""""""""""""""""""""""""
" WordProcessorMode 와 토글의 j k
nnoremap j gj
nnoremap k gk
	"nnoremap W B
	"nnoremap E gE

	" word-processor-mode-in-vim의 사용으로 정확한 줄의 이동을 기함
func! WordProcessorMode()
    " setlocal formatoptions=t1
    " setlocal textwidth=80
	nnoremap j gj
	nnoremap k gk
    " map j gj
    " map k gk "" 출처: http://jasonheppler.org/2012/12/05/word-processor-mode-in-vim/
    " setlocal smartindent
    " setlocal spell spelllang=en_us
    " setlocal noexpandtab
	echo " <WordProcessorMode> j/k의 키가 gj / gk로 설정했음"
endfu
com! WP call WordProcessorMode()	

	func! WordProcessorMode2()
		unmap j
		unmap k
		echo " <WordProcessorMode2> j/k의 키가 원래 j / k 기능을 복귀됐음"
	endfu
	com! WP2 call WordProcessorMode2()	


	" func! Write_Kor()
	" 	write
	" endfu
	" com! ㅈ call Write_Kor()	

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :exe getline(".") 빠른 명령실행!
	nnoremap <c-\> :exe getline(".")<CR>
	vnoremap <c-\> "cy:<c-u>exe getreg("c")<cr>
map <leader>nf :exec "!open -R ".shellescape(expand('%:p'))<CR>
	" vnoremap <F2> :<C-w>exe join(getline("'<","'>"), '<Bar>')<CR>
	"주석문comment  ls | echo "hello" | !say hello "주석문comment


""""""""""""""""""""""""""""""""""""""""""""""
" 빠른 jj의 <ESC>quick method 수집

" 성공이지만 잠시 esc로 복귀 inoremap <Esc> <ESC>`^h :nohlsearch<CR>i
" `^를 넣어서 이스케이프 후에 제 자리에 오게 할 것.
"inoremap <Esc> <Esc>`^
"inoremap <Esc> <Nop>
" imap <Esc> <ESC>`^h :nohlsearch<CR>i "실패
" inoremap <silent><Esc> :nohlsearch<CR>
" imap <silent><Esc> :nohlsearch<CR>
" noremap <silent><Esc> :nohlsearch<CR> ; :silent !/usr/local/bin/xkbswitch -s 3
noremap ㅓㅓ :silent !/usr/local/bin/xkbswitch -s 3<CR><Esc> 
" noremap <silent>ㅓㅓ:!/usr/local/bin/xkbswitch -s 3 & <CR>
"noremap <silent>ㅓㅓ:!xkbswitch -s 3 & <CR>
" 성공이지만 잠시 esc로 복귀 " 성공이지만 잠시 esc로 복귀 inoremap jj <ESC>`^ "매우 유용한 기능으로 편리함을 발견함.

" imap jj <ESC>`^ "위와 비교해서 약점이 존재함.
" 성공이지만 잠시 esc로 복귀 " 성공이지만 잠시 esc로 복귀 inoremap ㅓㅓ <ESC>`^ :silent !/usr/local/bin/xkbswitch -s 3<CR>	"매우 유용한 기술!!! 한글변환키를 붙인다면,,,,,
"No more having to reach for th... | Hacker News](https://news.ycombinator.com/item?id=9646982)
" imap ㅓㅓ <ESC>	"위와 비교해서 inore를 붙이고, `^ 보완.
" 성공이지만 잠시 esc로 복귀 " 성공이지만 잠시 esc로 복귀 inoremap ㅓㅏ <ESC>`^ :silent !/usr/local/bin/xkbswitch -s 3<CR>	"매우 유용한 기술!!! 한글변환키를 붙인다면,,,,,
" 성공이지만 잠시 esc로 복귀 inoremap jk <ESC>`^ "매우 유용한 기능으로 편리함을 발견함.
" 성공이지만 잠시 esc로 복귀 inoremap kk <ESC>`^ "매우 유용한 기능으로 편리함을 발견함.
" 성공이지만 잠시 esc로 복귀 noremap ㅓㅏ :silent !/usr/local/bin/xkbswitch -s 3<CR><Esc> 
" jj와 ㅓㅓ를 사용해서 이스케이프함!
" map.wiki의 Use jj를 참조할 것
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" space margin tab키 설정
" Add a bit extra margin to the left
set foldcolumn=1
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
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""
" INBOX 와 참고자료
"
"

""""""""""""""""""""""""""""""""""""""""""
" 시작시 열어둘버퍼목록을 설정함 
" 1. index.wiki 2. DiaryList.wiki
" edit +74 ~/vimwiki/index.wiki
" edit +24 ~/vimwiki/diary/DiaryList2Do.wiki
" e ~/vimwiki/diary/diary.wiki | normal! 22G3j
" e $MYVIMRC | normal! 65Gzz70G
" e ~/vimwiki/diary/DiaryList.wiki | :normal! 19G17G$3h

	" let @1='edit +74 ~/vimwiki/index.wiki'
	" let @2='edit +24 ~/vimwiki/diary/DiaryList2Do.wiki'
	" let @3='e ~/vimwiki/diary/diary.wiki | normal! 22G3j'
	" let @4='e $MYVIMRC | normal! 65Gzz182G'
	" let @5='e ~/vimwiki/diary/DiaryList.wiki | :normal! 19G17G$3h'
" 녹화의 실행아이디어쪼끔 - :edit +74 ~/vimwiki/index.wiki
		" 아래는 한 문장을 pipe 연결함.
		" let @"=':edit +74 ~/vimwiki/index.wiki^Medit +24 ~/vimwiki/diary/DiaryList2Do.wiki^Me ~/vimwiki/diary/diary.wiki | normal! 22G3j^Me $MYVIMRC | normal! 65Gzz70G^Me ~/vimwiki/diary/DiaryList.wiki | :normal! 19G17G$3h^M'

" let @q=' :e! 
'
" let @e='gt:e!
'
"bufdo normal @q
"gt:e!
"머글과 위저드의 차이를 기술한 동영상참조함24:00
""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"


