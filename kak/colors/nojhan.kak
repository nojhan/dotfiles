evaluate-commands %sh{
    light_blue="rgb:87bbff"
    blue="rgb:6f9dfe"
    dark_blue="rgb:4f7dde"

    light_magenta="rgb:c6b3fb"

    light_yellow="rgb:ffeb85"
    yellow="rgb:efcd45"
    dark_yellow="rgb:cf8200"

    green="rgb:a5c261"
    dark_green="rgb:529f50"

    red="rgb:db4939"

    cream="rgb:bf8753"
    dark_cream="rgb:363037"

    light_white="rgb:f8f8f8"
    white="rgb:d3d0cc"
    dark_white="rgb:73707c"

    light_black="rgb:4b4b4b"
    black="rgb:2b2b2b"
    mid_black="rgb:202020"
    dark_black="rgb:000000"

    # code
    echo "
    face global value ${dark_green},default
    face global type ${blue},default
    face global entity ${blue},default+b
    face global variable ${light_blue},default
    face global module ${light_blue},default
    face global string ${cream},${dark_cream}
    face global keyword ${red},default
    face global flow ${red},default+b # Keywords related to control flow (if, for, assert, etc.).
    face global state ${red},default  # Keywords reated to state (cast, new, sizeof, etc.).
    face global operator ${light_magenta},default
    face global attribute ${yellow},default
    face global comment ${green},default
    face global documentation ${green},default+b
    face global builtin ${light_white},default
    face global delimiter ${light_yellow},default
    
    face global meta ${dark_green},default+b
    face global identifier ${blue},default
    "

    # text
    echo "
    face global title ${black},${light_blue}+b
    face global header ${light_blue},default+b
    face global bold default,default+b
    face global italic default,default+i
    face global mono ${white},${mid_black}
    face global block ${light_yellow},default
    face global link ${dark_blue},default+u
    face global bullet ${dark_green},default+b
    face global list default,default+b
    "

    # kakoune UI
    echo "
    face global Default ${white},${black}
    face global PrimarySelection ${light_white},${dark_yellow}
    face global SecondarySelection ${light_white},${light_blue}
    face global PrimaryCursor ${black},${yellow}+Fb
    face global SecondaryCursor ${light_white},${blue}+Fb
    face global MatchingChar default,${blue}
    face global Whitespace ${dark_white},default
    face global BufferPadding ${light_black},${mid_black}
    face global LineNumbers ${dark_white},default
    face global LineNumberCursor ${white},default
    face global MenuForeground ${light_white},${dark_yellow}+b
    face global MenuBackground ${light_white},${dark_blue}
    face global MenuInfo ${light_white},${blue}+i
    face global Information ${white},${light_black}
    face global Error ${light_yellow},${red}
    face global StatusLine ${dark_black},${dark_blue}+b
    face global StatusLineMode ${light_white},${dark_yellow}+b
    face global StatusLineInfo ${light_white},${black}
    face global StatusLineValue ${black},${dark_yellow}
    face global StatusCursor ${light_white},${yellow}
    face global Prompt ${dark_black},${dark_blue}+b
    face global Search ${black},${light_yellow}+Fi
    "
}
