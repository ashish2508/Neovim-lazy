i have wasted my 2 days placing this thing in my desktop 

currently using windows wsl with ubuntu stable version 

1st step install neovim latest version("\n") 
don't use sudo command for installing 
use these ones 

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

```
To expose nvim globally:
```
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
```
```
And the following line to your shell config (~/.bashrc, ~/. zshrc, ...):

export PATH="$PATH:/opt/nvim/"
If the ./nvim.appimage command fails, try:

./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```
