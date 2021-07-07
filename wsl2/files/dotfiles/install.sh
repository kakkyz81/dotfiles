#!/bin/bash
# ~/dotfiles/以下の .で始まるファイルを ~ にリンク作成する
for f in .??*;
do
#    [[ "$f" == ".git" ]] && continue
  if  [  -f $f ] ; then
    if  [  -f ~/$f -a  -L ~/$f ] ; then
       rm ~/$f
    fi
    ln -s ~/dotfiles/$f ~/$f 
  fi
done
# ~/dotfiles/以下の .で始まらないファイルを ~ にリンク作成する
for f in *;
do
  [[ "$f" == "install.sh" ]] && continue # このシェル自体はリンク不要
  if  [  -f $f ] ; then
    if  [  -f ~/$f -a  -L ~/$f ] ; then
       rm ~/$f
    fi
    ln -s ~/dotfiles/$f ~/$f 
  fi
done

