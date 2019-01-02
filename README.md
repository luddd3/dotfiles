# Description

My config files for various programs like Sublime, tmux, etc.

## Applications

### rofi
Show window

```bash
$ rofi -show window -font "snap 10" -fg "#505050" -bg "#000000" -hlfg "#ffb964" -hlbg "#000000" -o 85
```

### [ncdu (NCurses Disk Usage)](https://dev.yorhel.nl/ncdu)
A smart cli program which can be used to find space hogs

## Resources

### Git

#### How to work with private fork of public repo
[https://stackoverflow.com/questions/10065526/github-how-to-make-a-fork-of-public-repository-private](https://stackoverflow.com/questions/10065526/github-how-to-make-a-fork-of-public-repository-private)

## Random How-to

### Linux

#### Change backlight

```bash
$ xbacklight -inc 10
$ xbacklight -dec 10
```

#### Eternal bash history
Paste this into .bashrc

```
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
```
