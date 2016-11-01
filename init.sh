script_dir="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"
ln -s "${script_dir}/.vimrc" ~/.vimrc
ln -s "${script_dir}/.gvimrc" ~/.gvimrc
ln -s "${script_dir}/.vim" ~/.vim
ln -s "${script_dir}/.vimperatorrc" ~/.vimperatorrc
ln -s "${script_dir}/vimperator" ~/.vimperator
git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/repos/github.com/Shougo/dein.vim
