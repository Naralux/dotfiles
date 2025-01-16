# Dotfiles

This repository contains the dotfiles for my preferred setup. The `.zshrc` file bootstraps the environment I prefer to work in. It does this by utilising Zinit as the package manager for some essential tools. GNU Stow is used to manage the symlinks from this repository into the system's filesystem.

## Installation

### Minimum Requirements

> [!NOTE]
> Use the package manager appropriate for your system.

Ensure you have the following installed on your system: `git`, `stow` and `zsh`.

```
$ apt install git stow zsh
```

Set zsh as your shell:
```
$ chsh -s $(which zsh)
```

For WSL there are some additional requirements, see [WSL](#WSL).

---

## Usage

First, check out the dotfiles repo in your `$HOME` directory using git:

```
$ cd $HOME
$ git clone git@github.com/Naralux/dotfiles.git
$ cd dotfiles
```

Then use GNU Stow to create symlinks for the packages you wish to have configured, e.g. Zsh and Alacritty:

```
$ stow -S zsh alacritty
```

### WSL

Ubuntu's WSL distro has some additional requirements, since the WSL version of the distro does not contain all the packages a full-fat Ubuntu distro does. Make sure you also have `jq` and `gcc` installed.

When using Ubuntu on WSL I found that stowing caused the entire `.config` folder to be symlinked instead of just the files.
Programs that add files/folders to the `.config` directory (e.g. IntelliJ) end up modifying/adding files in the repository that should not be part of the repository.

I think this is caused by the absence of a `.config` folder in a fresh Ubuntu WSL installation. In order to stow files without symlinking an entire directory, use the `--no-folding` option:

```
$ stow --no-folding -S zsh
```

---

## Configurations

Outlined below are descriptions of what each Stow package aim to bootstrap.

### zsh

The `zsh/.zshrc` file sets up the following:

- [Zinit](https://github.com/zdharma-continuum/zinit) package manager, including some packages and snippets I consider to be part of my baseline:
    - [Fzf](https://github.com/junegunn/fzf)
    - [Oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)
    - [Mise](https://github.com/jdx/mise)
    - [NeoVim](https://neovim.io/)
- Completion styling
- Aliasses
- Keybinds
- Miscellanious Options

File `zsh/.config/oh-my-posh/zen.toml` describes the theme to be used by Oh-my-posh.

### alacritty

[Alacritty](https://github.com/alacritty/alacritty) must first be installed on the system.

File `alacritty/.config/alacritty/alacritty.toml` describes the terminal styling used for Alacritty.

### nvchad

Folder `nvchad/.config/nvim` sets up NeoVim with the [NvChad](https://github.com/NvChad/NvChad) template.

## Other

### Papis - Document and bibliography manager
1. Install [papis](https://github.com/papis/papis):

```
$ python -m pip install --user papis
```

#### papis.nvim - Papis + Neovim integration
1. NeoVim must be installed.
2. Papis must be installed.
3. Install requirements for [papis.nvim](https://github.com/jghauser/papis.nvim?tab=readme-ov-file#installation):

```
$ sudo dnf install yq sqlite sqlite-devel luarocks
```

4. Stow the `papis.nvim` package.

---

## More Info

The GNU Stow [manual](https://www.gnu.org/software/stow/manual/stow.html).

[Article](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) on using GNU Stow for managing dotfiles.
