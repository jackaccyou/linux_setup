
        " Vundle
        filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	" call vundle#begin('~/some/path/here')

          " let Vundle manage Vundle, required
          Plugin 'VundleVim/Vundle.vim'

          " The following are examples of different formats supported.
          " Keep Plugin commands between vundle#begin/end.

          " Solarized theme
          Plugin 'altercation/vim-colors-solarized'

          " SingleCompile
          Plugin 'xuhdev/SingleCompile'

          Plugin 'davidhalter/jedi-vim'
              let g:jedi#completions_command = "<C-Space>"
              let g:jedi#completions_enabled = 1

          Plugin 'jiangmiao/auto-pairs'
          "Plugin 'vim-syntastic/syntastic'
              "set statusline+=%#warningmsg#
              "set statusline+=%{SyntasticStatuslineFlag()}
              "set statusline+=%*

              "let g:syntastic_always_populate_loc_list = 1
              "let g:syntastic_auto_loc_list = 1
              "let g:syntastic_check_on_open = 1
              "let g:syntastic_check_on_wq = 0

          Plugin 'Chiel92/vim-autoformat'
                  map <C-F> :Autoformat<CR>

          Plugin 'Valloric/YouCompleteMe'
                  set encoding=utf-8
                  let g:ycm_global_ycm_extra_conf = expand("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py")

          Plugin 'tpope/vim-surround'

          Plugin 'vim-airline/vim-airline'
              set laststatus=2
              " Enable the list of buffers
              let g:airline#extensions#tabline#enabled = 1
              " Show just the filename
              let g:airline#extensions#tabline#fnamemod = ':t'


          Plugin 'ervandew/supertab'
          Plugin 'SirVer/ultisnips'
          Plugin 'honza/vim-snippets'
                    " make YCM compatible with UltiSnips (using supertab)
                    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
                    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
                    let g:SuperTabDefaultCompletionType = '<C-n>'

                    " better key bindings for UltiSnipsExpandTrigger
                    let g:UltiSnipsExpandTrigger = "<tab>"
                    let g:UltiSnipsJumpForwardTrigger = "<tab>"
                    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
                    let g:UltiSnipsEditSplit='vertical'

          Plugin 'kien/ctrlp.vim'
          Plugin 'scrooloose/nerdtree'
          map <leader>t :NERDTreeToggle<CR>

          " All of your Plugins must be added before the following line
          call vundle#end()            " required
          filetype plugin indent on    " required
          " To ignore plugin indent changes, instead use:
          "filetype plugin on
          "
          " Brief help
          " :PluginList       - lists configured plugins
          " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
          " :PluginSearch foo - searches for foo; append `!` to refresh local cache
          " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
          "
          " see :h vundle for more details or wiki for FAQ
          " Put your non-Plugin stuff after this line

          """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
          "                       General                            "
          """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

            " {
                filetype plugin indent on   " Automatically detect file types.
                set mouse=a                 " Automatically enable mouse usage
                set mousehide               " Hide the mouse cursor while typing
                set backspace=indent,eol,start
                
                fu! SaveSess()
                  execute 'mksession! ~/.vim/.session.vim'
                endfunction

                fu! RestoreSess()
                  if filereadable($VIM . '~/.vim/.session.vim')
                    echo("found")
                    execute 'so ~/.vim/.session.vim'
                    if bufexists(1)
                        for l in range(1, bufnr('$'))
                          if bufwinnr(l) == -1
                            exec 'sbuffer ' . l
                          endif
                        endfor
                    endif
                  endif
                endfunction

                autocmd VimLeave * call SaveSess()
                autocmd VimEnter * nested call RestoreSess()
            " }

            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "                       Fonts                              "
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

              " {
                  if has("gui_running")
                    if has("gui_gtk2")
                      set guifont=Inconsolata\ 12
                    elseif has("gui_macvim")
                      set guifont=Menlo\ Regular:h14
                    elseif has("gui_win32")
                      set guifont=Consolas:h13:cANSI
                    endif
                  endif
              " }


            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "                       Colors Settings                    "
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

              " {
                  syntax enable       " switches on syntax highlighting
                  set background=dark
                  if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
                          let g:solarized_termcolors=256
                          let g:solarized_termtrans=1
                          let g:solarized_contrast="normal"
                          let g:solarized_visibility="normal"
                   colorscheme solarized
                  endif
              " }

              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
              "                       Remap                              "
              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " {
                    "Leader Shortcuts
                    " leader is comma
                      let mapleader=","

                    "SingleCompile
                      map <F9> :SCCompile<cr>
                      map <F10> :SCCompileRun<cr>

                    "nerdtree
                      map <leader>t :NERDTreeToggle<CR>

                    " jk is escape
                    inoremap jk <esc>
                    vnoremap jk <esc>
                    " save session
                    nnoremap <leader>s :mksession<CR>

                    "Movement
                      " move vertically by visual line
                      nnoremap j gj
                      nnoremap k gk
                      " move between split windows
                      nnoremap <C-J> <C-W><C-J>
                      nnoremap <C-K> <C-W><C-K>
                      nnoremap <C-L> <C-W><C-L>
                      nnoremap <C-H> <C-W><C-H>

                    "Buffer
                      " Move to the next buffer
                      nmap <leader>l :bnext!<CR>

                      " Move to the previous buffer
                      nmap <leader>h :bprevious!<CR>

                      " To open a new empty buffer
                      nmap <leader>n :enew<cr>

                      " Close the current buffer and move to the previous one
                      nmap <leader>c :bp <BAR> bd #<CR>

                " }


              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
              "                       Folding                            "
              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                " {
                    set foldenable          " enable folding
                    set foldlevelstart=10   " open most folds by default, only very
                                            " nested blocks of code are foded
                    set foldnestmax=10      " 10 nested fold max
                    set foldmethod=syntax   " fold based on syntax
                " }


              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
              "                       Searching                          "
              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                " {
                    set incsearch           " search as characters are entered
                    set hlsearch            " highlight matches
                    " turn off search highlight (, space)
                    nnoremap <leader><space> :nohlsearch<CR>
                " }


              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
              "                       UI Config                          "
              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                " {
                    set number              " show line numbers
                    nnoremap <leader>n :call NumberToggle()<cr> " to change between relative number
                    autocmd InsertEnter * :set norelativenumber
                    autocmd InsertLeave * :set relativenumber
                    set showcmd             " show command in bottom bar
                    set cursorline          " highlight current line
                    filetype indent on      " load filetype-specific indent files
                    set wildmenu            " visual autocomplete for command menu
                    set lazyredraw          " redraw only when we need to.
                    set showmatch           " highlight matching [{()}]
                    set showmode            " Display the current mode

                  function! NumberToggle()
                    if(&relativenumber == 1)
                      set norelativenumber
                    else
                      set relativenumber
                    endif
                  endfunc
                " }


              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
              "                       Spaces & Tabs                      "
              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                " {
                    set tabstop=4       " number of visual spaces per TAB
                    set softtabstop=4   " number of spaces in tab when editing
                    set expandtab       " tabs are spaces
                " }



              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
              "                       Default Settings                   "
              """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                " {
                    source $VIMRUNTIME/vimrc_example.vim
                    source $VIMRUNTIME/mswin.vim
                    behave mswin

                    set diffexpr=MyDiff()
                    function MyDiff()
                      let opt = '-a --binary '
                      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
                      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
                      let arg1 = v:fname_in
                      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
                      let arg2 = v:fname_new
                      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
                      let arg3 = v:fname_out
                      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
                      if $VIMRUNTIME =~ ' '
                        if &sh =~ '\<cmd'
                          if empty(&shellxquote)
                            let l:shxq_sav = ''
                            set shellxquote&
                          endif
                          let cmd = '"' . $VIMRUNTIME . '\diff"'
                        else
                          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
                        endif
                      else
                        let cmd = $VIMRUNTIME . '\diff'
                      endif
                      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
                      if exists('l:shxq_sav')
                        let &shellxquote=l:shxq_sav
                      endif
                    endfunction
                " }




"Autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :%s/\s\+$//e
"   autocmd FileType java setlocal noexpandtab
"   autocmd FileType java setlocal list
"   autocmd FileType java setlocal listchars=tab:+\ ,eol:-
"   autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END



