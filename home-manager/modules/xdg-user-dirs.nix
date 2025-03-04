{ ... }: 
{
    xdg = {
        userDirs = {
            enable = true;
            createDirectories = true;
            documents = "\$HOME/doc";
            download = "\$HOME/dl";
            music = "\$HOME/music";
            pictures = "\$HOME/pic";
            videos = "\$HOME/vid";
        };
    };
}

