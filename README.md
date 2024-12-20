# Dotfiles

This repository contains the dotfiles for my preferred setup.

## Requirements

Ensure you have the following installed on your system.

### Git

```
$ apt install git
```

### Stow

```
$ apt install stow
```

### zsh

```
$ apt install zsh
```

### fzf

Since the packaged version of [fzf](https://github.com/junegunn/fzf) is out of date for quite a few platforms, it's installed manually into the `$HOME` directory.
See the installation instructions [here](https://github.com/junegunn/fzf?tab=readme-ov-file#using-git).
When the installer asks you if you want to add lines to the `.zshrc`, say no. The line is already part of the `.zshrc`.

### oh-my-posh

See the installation instructions [here](https://ohmyposh.dev/).

## Installation

First, check out the dotfiles repo in your `$HOME` directory using git

```
$ cd $HOME
$ git clone git@github.com/Naralux/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks for the packages you have installed e.g. zshrc

```
$ stow zsh
```

Also see [this](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) article on using GNU Stow for managing dotfiles.