# Dotfiles

This repository contains the dotfiles for my preferred setup.

## Minimum Requirements

> [!NOTE]
> Use the package manager appropriate for your system.

Ensure you have the following installed on your system.

### Git

```
$ apt install git
```

### Stow

```
$ apt install stow
```

### Zsh

```
$ apt install zsh
```

### oh-my-posh

See the installation instructions [here](https://ohmyposh.dev/). Make sure oh-my-posh is installed in a folder that is owned by the user (e.g. `$HOME/.local/bin/`), otherwise you might run into permission problems when upgrading oh-my-posh.

## Installation

First, check out the dotfiles repo in your `$HOME` directory using git:

```
$ cd $HOME
$ git clone git@github.com/Naralux/dotfiles.git
$ cd dotfiles
```

Then use GNU Stow to create symlinks for the packages you have installed e.g. zsh and NvChad:

```
$ stow -S zsh nvchad
```

### WSL

When using Ubuntu on WSL I found that stowing caused the entire `.config` folder to be symlinked instead of just the files.
Programs that add files/folders to the `.config` directory (e.g. IntelliJ) end up modifying/adding files in the repository that should not be part of the repository.

I think this is caused by the absence of a `.config` folder in a fresh Ubuntu WSL installation. In order to stow files without symlinking an entire directory, use the `--no-folding` option:

```
$ stow --no-folding -S zsh
```

---

## Instructions for additional tools

### NvChad
1. Install [Neovim](https://neovim.io/).
2. Stow the `nvchad` package.

### Papis - Document and bibliography manager
1. Install [papis](https://github.com/papis/papis):

```
$ python -m pip install --user papis
```

#### papis.nvim - Papis + Neovim integration
1. Install requirements for [papis.nvim](https://github.com/jghauser/papis.nvim?tab=readme-ov-file#installation):

```
$ sudo dnf install yq sqlite sqlite-devel luarocks
```

2. Stow the `papis.nvim` package.

---

## More Info

The GNU Stow [manual](https://www.gnu.org/software/stow/manual/stow.html).

[Article](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) on using GNU Stow for managing dotfiles.
