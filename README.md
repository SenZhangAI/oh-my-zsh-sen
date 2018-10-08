This is inspired by [yoshiori](https://github.com/yoshiori/oh-my-zsh-yoshiori)
Thanks to the origin author!

## zsh my custom using oh-my-zsh

Because oh-my-zsh is very slow in Cygwin(caused by git and havn't fixed this problem),
I tried to write another config for zsh.  See [zsh-sen](https://github.com/SenZhangAI/zsh-sen)

### Install
----------------

1. install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

2. cd to your-dir

3. `git clone git://github.com/SenZhangAI/oh-my-zsh-sen.git`

4. `cd oh-my-zsh-sen`

5. add or delete plugins as you like in `plugins.conf`, for example:

```
git z zsh-syntax-highlighting
```

6. `./install.sh`

7. `source ~/.zshrc`

### uninstall
----------------
1. `cd oh-my-zsh-sen`

2. `./uninstall.sh`

3. delete plugins related in `~/.zshrc`
