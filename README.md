# Steam ICON
Fixes shortcut icons. Icons are downloaded from [steamdb.info](https://steamdb.info)

## how to use (single icon)
Drag the shortcut with a broken icon to `steamicon.bat`

It should download the .ico file and place it in `C:\Program Files (x64)\Steam\steam\games` directory. *If the shortcut icon points to a different folder for the icon, it will download it there instead.*

## fix start menu icons
Locate your Steam icons folder. It should be located at `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Steam`

Drag the folder `Steam` into `steamicon.bat` and it will automatically download all of the icons.