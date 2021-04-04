evaluate-commands %sh{
    light_blue="rgb:87bbff"
    blue="rgb:6f9dfe"
    dark_blue="rgb:5f8dee"

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
    dark_white="rgb:93907c"

    light_black="rgb:4b4b4b"
    black="rgb:2b2b2b"
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
    face global flow ${red},default+b
    face global state ${red},default
    face global operator ${light_magenta},default
    face global attribute rgb:ffc66d,default
    face global comment ${green},default
    face global documentation ${green},default+b
    face global meta rgb:787878,default
    face global identifier rgb:ffc66b,default
    face global error rgb:000000,rgb:ff0000
    face global builtin ${light_white},default
    face global delimiter ${light_yellow},default
    "

    # text
    echo "
    face global title rgb:ffffff,default+b
    face global header rgb:ffffff,default
    face global bold rgb:ffffff,default+b
    face global italic rgb:121212,default+i
    face global mono rgb:333333,rgb:dedede
    face global block rgb:333333,rgb:dedede
    face global link rgb:ffffff,default
    face global bullet rgb:ffffff,default
    face global list rgb:212121,default
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
    face global BufferPadding rgb:cccccc,rgb:262121
    face global LineNumbers rgb:8a8a8a,default
    face global LineNumberCursor rgb:999999,default
    face global MenuForeground ${light_white},${dark_yellow}+b
    face global MenuBackground ${light_white},${blue}
    face global MenuInfo ${white},${dark_blue}
    face global Information ${white},${light_black}
    face global Error rgb:ededed,rgb:212121
    face global StatusLine ${light_white},${dark_blue}
    face global StatusLineMode ${light_white},${dark_yellow}+b
    face global StatusLineInfo ${light_white},${black}
    face global StatusLineValue ${black},${dark_yellow}
    face global StatusCursor ${light_white},${yellow}
    face global Prompt ${dark_black},${dark_blue}+b
    face global Search ${black},${light_yellow}+Fi
    "
}
