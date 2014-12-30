mklink %HOMEPATH%\_vimrc %~dp0.vimrc
mklink %HOMEPATH%\_gvimrc %~dp0.gvimrc
mklink /D %HOMEPATH%\vimfiles %~dp0.vim
mklink /D %HOMEPATH%\.vim %HOMEPATH%\vimfiles
mklink %HOMEPATH%\_vimperatorrc %~dp0.vimperatorrc
mklink /D %HOMEPATH%\vimperator %~dp0vimperator
git clone https://github.com/Shougo/neobundle.vim %~dp0.vim\bundle\neobundle.vim
exit 0
