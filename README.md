# Steam ICON
Fixes shortcut icons. Icons are downloaded from [steamdb.info](https://steamdb.info)

# Usage 
## how to use (single icon)
Drag the shortcut with a broken icon to `steamicon.bat`

It should download the .ico file and place it in `C:\Program Files (x64)\Steam\steam\games` directory. *If the shortcut icon points to a different folder for the icon, it will download it there instead.*

## fix start menu icons
Locate your Steam icons folder. It should be located at `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Steam`

Drag the folder `Steam` into `steamicon.bat` and it will automatically download all of the icons.


# Why Batch script?
**No installs**

Unlike Python, there is no need to install anything to run the script. 

**No compiling**

Unlike C or Rust, a batch script does not need to be compiled. The source code is available for anyone to see what is happening - making sure there is nothing malicious. 