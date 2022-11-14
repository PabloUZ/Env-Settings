# ZSH

## ZSH Install

```bash
    $ sudo apt install zsh
```
## OhMyZSH Install

[OHMYZSH](https://ohmyz.sh/)
> Before installing OhMyZSH, We have to install curl and wget
```bash
    $ sudo apt install curl wget
```
> Then install OhMyZSH with curl
```bash
    $ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
> Or with wget
```bash
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

## Install TILIX emulator
> Tilix is an emulator for the shell

```bash
    $ sudo apt install tilix
```
### Set tilix as default emulator
> First run the following command:
```bash
    $ sudo update-alternatives --config x-terminal-emulator
```
> Then select the option for tilix


## Custom ZSH
### Choosing theme
> Go to [OHMYZSH github repo](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) and choose your theme
### Applying theme to zsh config
> First of all, make sure you are in your home directory (~)\
> Open the .zshrc file with your text editor, let's use vim:
```bash
    $ vim .zshrc
```
> Then we have to look for the line 'ZSH_THEME' and change it's value for the name of your selected theme

> After that, just close vim by pressing 'ESC' and then 'SHIFT+Z+Z'

> Custom ZSH theme in ~/.oh-my-zsh/themes/

> To see the changes, just run:
```bash
    $ zsh
```
## Set ZSH as default shell
```bash
    $ chsh -s /bin/zsh
```

## Install GOGH colors
> GOGH adds a color palette to your terminal.

> Choose the [GOGH color palette](https://gogh-co.github.io/Gogh/):\
> Then run the following command:
```bash
    $ bash -c  "$(wget -qO- https://git.io/vQgMr)"
```
> Look for the color palette name on the list and put the number in the prompt\
> Reload the shell using:
```bash
    $ zsh
```
## Install plugins for ZSH
> From the home directory move to the folder **_~/.oh-my-zsh/custom/plugins_**\
> Then clone the repository of the plugin you want to install.

> Here are some of the recommended plugins:\
> - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
> - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
> - [web-search](https://github.com/sineto/web-search)
> - [oh-my-matrix](https://github.com/amstrad/oh-my-matrix)