#!/bin/sh

echo "- Let's setup the scripts"

for file in *; do
  if [[ "$file" != *.md ]] && [[ "$file" != *.sh ]]; then
    chmod +x "$file"
  fi
done


current_dir=$PWD
load_scripts="export PATH=\$PATH:$current_dir"

echo "- Then, let's add the scripts into your .zshrc"

if [ -f ~/.zshrc ]; then

    echo "- Found .zshrc file"

    # Check if the directory is already in the PATH
    if ! echo "$PATH" | grep -q "$current_dir"; then

      echo "\n\n# Git Custom Commands" >> ~/.zshrc
      echo $load_scripts >> ~/.zshrc

      echo "- Re loading .zshrc"
      source ~/.zshrc

      echo "- Added GIT Custom Commmads to PATH"
    else
      echo "- GIT Custom Commmads already in PATH"
    fi

else

    echo "- No .zshrc file found, creating one"

    touch ~/.zshrc

    echo "\n\n# Git Custom Commands" >> ~/.zshrc
    echo $load_scripts >> ~/.zshrc

    echo "- Re-loading .zshrc"
    source ~/.zshrc

fi
