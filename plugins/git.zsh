uncommitted(){
  for gitdir in `find ./ -name .git`;
  do
    workdir=${gitdir%/*};
    if git --git-dir=$gitdir --work-tree=$workdir status | grep -q modified;
    then
	echo $workdir;
    fi
  done
}

function git-sub-rm(){
  git rm --cached $1
  awk -v reg="submodule \"$1\"" '$0 ~ reg {c=3}!(c&&c--)'  .gitmodules >/tmp/.gitmodules
  cp /tmp/.gitmodules .
  rm -rf $1
}

function git-sub-up(){
 git submodule foreach git pull
}

function git-ssh-remote(){
  remote=`git push origin master 2>&1 | awk '/Use.*/{print $2}'`
  remote=`echo $remote | sed -e 's/https:\/\/github.com/git@github.com:/g'`
  git remote add github $remote
}

function git-remaster(){
  git stash
  git checkout master
  git pull origin master
  git stash apply stash@\{0\}
}
function git-re-attach(){
  git checkout master
  git merge HEAD@{1}
}

# see http://tinyurl.com/aatlung
function git-unstash-file(){
  git checkout stash@{0} -- $1
}

function gh-pages-clean(){
  git checkout --orphan gh-pages
  git rm -rf .
  rm '.gitignore'
}

# Remove multiple remote git branches
function rm-remote-branch(){
  git branch -r | awk -F/ "/\/$1/{print \$2}" | xargs -I {} git push origin :{}
}

function rm-remote-branch-dry(){
  git branch -r | awk -F/ "/\/$1/{print \$2}"
}

# Aliases
alias g='git'
alias ga='git add'
alias gs='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpom='git push origin master'
alias gd='git diff'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gitc='git commit -a -m '
alias gits='git status '
alias gco='git checkout'


