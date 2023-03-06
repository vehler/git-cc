# Welcome to Git custom commands

Please remember to add custom commands to `$PATH`. This will help Git to recognize the custom commands.

We are adding the directory to `$PATH`. Add the following line to `bashrc` or to `zshrc`

```export PATH=$PATH:/your-directory/git-cc```

You can now source the file or start a new instance of the terminal

```source ~/.zshrc```

Also remember to make all files executable with:

```chmod +x git-lazypush```