#!/bin/sh
mkdir tmp
cd tmp
tag=$(curl -fsSL https://api.github.com/repos/ogham/exa/releases/latest | jq -r .tag_name)
wget "https://github.com/ogham/exa/releases/download/$tag/exa-linux-x86_64-$tag.zip"
unzip exa-linux-x86_64-$tag.zip
sudo mv bin/* /usr/local/bin
sudo mkdir -p /usr/share/fish/completions
sudo mv completions/* /usr/share/fish/completions/
sudo mv man/* /usr/share/man/man1/
cd ../
rm -rf tmp
