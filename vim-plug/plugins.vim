" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " NVcode theme
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Airline for statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'    
    
    " Ranger plugin
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    
    " Plugin for git commands
    Plug 'tpope/vim-fugitive'
    
    " Plugin that shows when lines are different from preivous commit
    Plug 'mhinz/vim-signify'
    
    " Plugin for floaterm
    Plug 'voldikss/vim-floaterm' 
    
    " Plugin for fzf, perfoms latest install of fzf as well
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'    
    Plug 'airblade/vim-rooter'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
	\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
