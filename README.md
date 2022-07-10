# DotFiles

```sh
brew install \
    antibody \
    neovim \
    starship \
    chafa \
    exiftool \
    fd \
    rg \
    exa \
    bat
```

There could be a couple more depending on the setup (`pyenv`, `volta`, etc)

# Antibody

The home directory of anibody plugins can be found as:

```sh
antibody home
```

Once antibody is installed, you need to run:

```sh
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
```

# Fzf

Fzf is installed by the plugin `unixorn/fzf-zsh-plugin`

# Warning

Do not change the order of `.zsh_plugins.txt`. The load order of the plugins is
important.
