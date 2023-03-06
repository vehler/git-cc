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

    if grep -q \"$load_scripts\" ~/.zshrc; then
        echo "- Scripts already loaded"
    else
        echo "\n\n# Git Custom Commands" >> ~/.zshrc
        echo $load_scripts >> ~/.zshrc
    fi

    echo "- Re-loading .zshrc"
    source ~/.zshrc

else

    echo "- No .zshrc file found, creating one"

    touch ~/.zshrc

    echo load_scripts >> ~/.zshrc

fi
