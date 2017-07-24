This is inspired by [yoshiori](https://github.com/yoshiori/oh-my-zsh-yoshiori)
Thanks to the origin author!

## zsh my custom using oh-my-zsh

Because oh-my-zsh is very slow in some situation, I tried to write another config for zsh.

This is still useful if use oh-my-zsh directly.

See [zsh-sen](https://github.com/SenZhangAI/zsh-sen)

### Install
----------------

1. install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

2. cd to your-dir

3. `git clone git://github.com/SenZhangAI/oh-my-zsh-sen.git`

4. `cd oh-my-zsh-sen`

5. `./install.sh`

6. add plugins by modify the `~/.zshrc`, for example:

```bash
#plugins=(git) #the original config
plugins=(git z vi-mode zsh-syntax-highlighting)
```

7. `source ~/.zshrc`

### uninstall
----------------
1. `cd oh-my-zsh-sen`

2. `./uninstall.sh`

3. delete plugins related in `~/.zshrc`
