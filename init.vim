vim9script

# Vim configuration

# Copyright (c) 2022-2024 Oleksandr Manenko

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Emacs; see the file COPYING.  If not, write to the
# Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301, USA.

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lunacookies/vim-colors-xcode'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'github/copilot.vim'
Plug 'imsnif/kdl.vim'
call plug#end()

if !exists('g:syntax_on')
  syntax enable
endif

# Enable file type detection.
filetype plugin on
filetype plugin indent on

# Copy indent from current line when starting a new line.
set autoindent

# Make backspace to behave "normally" (deleting indentation, line
# breaks, pre-existing characters) while in insert mode.
set backspace=indent,eol,start

# A <Tab> in front of a line inserts blanks according to 'shiftwidth'.
# A <BS> will delete a 'shiftwidth' worth of space at the start of the
# line.
set smarttab

# Always show status line.
set laststatus=2

# Show the line and column number of the cursor position.
set ruler

# Delete comment characters when joining commented lines.
set formatoptions+=j
# Disable autowrapping
set formatoptions-=t

# Text with is 80 chars
set textwidth=80

# Right margin is one character past textwidth.
set colorcolumn=+1
# Right margin color.
#highlight ColorColumn ctermbg=lightgrey

# Ignore case of normal letters when the pattern contains lowercase
# letters only.
set ignorecase smartcase

# Show line numbers relative to the line with the cursor.
set number relativenumber

# Do not create swap files for buffers.
set noswapfile

# Delete a backup file once the original file has been successufully
# written.
set nobackup

# Make sure all folds are open.
set nofoldenable

# Do not unload buffer when it is abandoned, make it hidden instead.
set hidden

set wildmenu
set wildmode=list:longest
set pumheight=10

set completeopt=menu,menuone,noinsert

# Perform spell checks.
#
# ]s - navigate to the next misspelled word,
# [s - navigate to the previous misspelled word,
# z= - show spelling suggestions for the word under the cursor,
# zg - add the word under the cursor as a good word to the local dictionary,
# zw - remove the word under the cursor from the local dictionary.
set spell

# Enable mouse
set mouse=a

# Display tralining whitespaces as middle dot a.k.a. interpunct.
set list
set listchars=tab:\ \ ,trail:·

# Set the terminal cursor shape depending on the current mode.
# Set IBeam shape in insert mode, underline shape in replace mode and
# block shape in normal mode.
&t_SI = "\e[6 q"
&t_SR = "\e[4 q"
&t_EI = "\e[2 q"

autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen

#set background=dark
#colorscheme retrobox
set background=light
colorscheme xcodelighthc

# Make sure Vim inherits environment variables from my shell
set shell=/bin/zsh

# ------------------------------------------------------------------------------
# Rust config
# ------------------------------------------------------------------------------

g:rustfmt_autosave                   = 0
g:rustfmt_emit_files                 = 1
g:rustfmt_fail_silently              = 0
g:rustfmt_autosave_if_config_present = 1
g:rustfmt_command                    = 'rustup run nightly rustfmt '

# ------------------------------------------------------------------------------
# ALE config
# ------------------------------------------------------------------------------

g:ale_linters                    = {'rust': ['analyzer', 'cargo']}
g:ale_rust_cargo_use_clippy      = executable('cargo-clippy')
g:ale_virtualtext_cursor         = 'current'
g:ale_hover_cursor               = 0
g:deoplete#enable_at_startup     = 1
g:airline#extensions#ale#enabled = 1

# ------------------------------------------------------------------------------
# Key bindings
# ------------------------------------------------------------------------------

nnoremap <SPACE> <Nop>
map <nowait> <Space> <Leader>

nmap <Leader>bn :bnext<CR>
nmap <Leader>bp :bprevious<CR>

nmap <Leader>lg :GFiles<CR>
nmap <Leader>lb :Buffers<CR>
nmap <Leader>lf :Files<CR>

nmap <Leader>gd :ALEGoToDefinition<CR>
nmap <Leader>ca :ALECodeAction<CR>
nmap <Leader>ch :ALEHover<CR>

