
# Blues
declare-option -hidden str kalolo_shiny_blue    rgb:b7dbff
declare-option -hidden str kalolo_light_blue    rgb:87bbff
declare-option -hidden str kalolo_blue          rgb:6f9dfe
declare-option -hidden str kalolo_dark_blue     rgb:4f7dde

# Magentas
declare-option -hidden str kalolo_light_magenta rgb:c6b3ff
declare-option -hidden str kalolo_magenta       rgb:a073bb

# Yellows
declare-option -hidden str kalolo_light_yellow  rgb:fffb95
declare-option -hidden str kalolo_mid_yellow    rgb:f5db65
declare-option -hidden str kalolo_yellow        rgb:efcd45
declare-option -hidden str kalolo_dark_yellow   rgb:cf8200

# Greens
declare-option -hidden str kalolo_shiny_green   rgb:b1cfb1
declare-option -hidden str kalolo_light_green   rgb:b5d271
declare-option -hidden str kalolo_green         rgb:a5c261
declare-option -hidden str kalolo_dark_green    rgb:529f50

# Reds
declare-option -hidden str kalolo_light_red     rgb:ff5949
declare-option -hidden str kalolo_red           rgb:db4939
declare-option -hidden str kalolo_dark_red      rgb:cb3929

# Orange-ish
declare-option -hidden str kalolo_cream         rgb:bf8753
declare-option -hidden str kalolo_dark_cream    rgb:363037

# Whites
declare-option -hidden str kalolo_light_white   rgb:f8f8f8
declare-option -hidden str kalolo_white         rgb:d3d0cc
declare-option -hidden str kalolo_mid_white     rgb:b1bfb1
declare-option -hidden str kalolo_dark_white    rgb:73707c

# Blacks
declare-option -hidden str kalolo_light_black   rgb:4b4b4b
declare-option -hidden str kalolo_mid_black     rgb:343534
declare-option -hidden str kalolo_black         rgb:2b2b2b
declare-option -hidden str kalolo_dawn_black    rgb:232323
declare-option -hidden str kalolo_dark_black    rgb:000000

# Code
# Comment are important information, they are the only thing in light green.
set-face global comment            "%opt{kalolo_green},default"
# Documentation is even more important, it's in bold.
set-face global documentation      "%opt{kalolo_green},default+b"
# Metadata are less important, they are in dark green.
set-face global meta               "%opt{kalolo_mid_white},%opt{kalolo_dawn_black}"
# Values are a kind of "side" information, they are in dark green.
set-face global value              "%opt{kalolo_dark_green},default"

# "Stable" objects in blue.
set-face global identifier         "%opt{kalolo_blue},default"
set-face global type               "%opt{kalolo_light_blue},default"
set-face global entity             "%opt{kalolo_magenta},default+b"

# "Mutable" objects in blue.
set-face global variable           "%opt{kalolo_white},default"
set-face global module             "%opt{kalolo_dark_blue},default"

# String are ubiquitous, they have their own color,
# with a different background, to easily spot multiline strings.
# set-face global string             "%opt{kalolo_cream},%opt{kalolo_dark_cream}"
set-face global string             "%opt{kalolo_shiny_green},%opt{kalolo_mid_black}"

# More or less single-character delimiter which are everywhere.
set-face global operator           "%opt{kalolo_light_magenta},default"
set-face global delimiter          "%opt{kalolo_light_yellow},default"

# Attributes in yellow.
set-face global attribute          "%opt{kalolo_yellow},default"

# Builtins in lighter white.
set-face global builtin            "%opt{kalolo_light_white},default"

# Generic keywords in red.
set-face global keyword            "%opt{kalolo_red},default"
# Additional keywords
set-face global flow               "%opt{kalolo_red},default+b" # Keywords related to control flow (if,for,assert,etc.).
set-face global state              "%opt{kalolo_red},default"   # Keywords reated to state (cast,new,sizeof,etc.).


# LSP faces

# Additionnal "function"
set-face global function           "%opt{kalolo_light_white},default"

# Faces used by inline diagnostics.
set-face global DiagnosticError    "rgb:ff0000,default"
set-face global DiagnosticWarning  "rgb:ff00ff,default"
# Faces used by inlay diagnostics.
set-face global InlayDiagnosticError   "rgb:ff00ff,default+i"
set-face global InlayDiagnosticWarning "rgb:ff00ff,default+i"
# Line flags for errors and warnings both use this face.
set-face global LineFlagErrors red
# Face for highlighting references.
# FIXME Reference faces not taken into account
set-face global Reference          "default,%opt{kalolo_light_black}+F"
set-face global ReferenceBind      "default,%opt{kalolo_light_black}+Fbu"
# Face for inlay hints.
set-face global InlayHint          "%opt{kalolo_light_white},default+i"

# text
set-face global title              "%opt{kalolo_light_blue},default+bi"
set-face global header             "%opt{kalolo_light_magenta},default+bu"
set-face global bold               "%opt{kalolo_light_yellow},default+b"
set-face global italic             "%opt{kalolo_light_white},default+i"
set-face global mono               "%opt{kalolo_white},%opt{kalolo_dawn_black}"
set-face global block              "%opt{kalolo_light_green},default"
set-face global link               "%opt{kalolo_dark_blue},default+u"
set-face global bullet             "%opt{kalolo_yellow},default+b"
set-face global list               "%opt{kalolo_light_white},default"

# kakoune UI
set-face global Default            "%opt{kalolo_white},%opt{kalolo_black}"
set-face global MatchingChar       "%opt{kalolo_light_white},%opt{kalolo_dark_green}"
set-face global Whitespace         "%opt{kalolo_dark_white},default"
set-face global BufferPadding      "%opt{kalolo_light_black},%opt{kalolo_dark_black}"
set-face global LineNumbers        "%opt{kalolo_dark_white},default"
set-face global LineNumberCursor   "%opt{kalolo_light_white},default"
set-face global LineNumbersWrapped "%opt(kalolo_dark_black)"
set-face global MenuForeground     "%opt{kalolo_light_white},%opt{kalolo_dark_yellow}+b"
set-face global MenuBackground     "%opt{kalolo_light_white},%opt{kalolo_dark_blue}"
set-face global MenuInfo           "%opt{kalolo_light_white},%opt{kalolo_blue}+i"
set-face global Information        "%opt{kalolo_white},%opt{kalolo_light_black}"
set-face global Error              "%opt{kalolo_light_yellow},%opt{kalolo_red}"
set-face global StatusLine         "%opt{kalolo_dark_black},%opt{kalolo_dark_blue}+b"
set-face global StatusLineMode     "%opt{kalolo_light_white},%opt{kalolo_dark_yellow}+b"
set-face global StatusLineInfo     "%opt{kalolo_light_white},%opt{kalolo_black}"
set-face global StatusLineValue    "%opt{kalolo_black},%opt{kalolo_dark_yellow}"
set-face global StatusCursor       "%opt{kalolo_light_white},%opt{kalolo_yellow}"
set-face global Prompt             "%opt{kalolo_dark_black},%opt{kalolo_dark_blue}+b"

# Additional UI
# Like a temporary comment: light green.
set-face global Search             "%opt{kalolo_black},%opt{kalolo_light_green}+i"

# Cursors varying with mode
# Default normal
set-face global PrimarySelection   "default,rgba:cf820075"
set-face global PrimaryCursor      "%opt{kalolo_black},%opt{kalolo_light_yellow}+F"
set-face global PrimaryCursorEol   "default,%opt{kalolo_light_red}+F"

set-face global SecondarySelection "default,rgba:cf820045"
set-face global SecondaryCursor    "%opt{kalolo_white},%opt{kalolo_dark_yellow}+F"
set-face global SecondaryCursorEol "default,%opt{kalolo_dark_red}+F"

# Switching to normal = shades of yellows
hook global ModeChange '.*:normal' %{
    set-face global PrimarySelection   "default,rgba:cf820075"
    set-face global PrimaryCursor      "%opt{kalolo_black},%opt{kalolo_light_yellow}+F"
    set-face global PrimaryCursorEol   "default,%opt{kalolo_light_red}+F"

    set-face global SecondarySelection "default,rgba:cf820045"
    set-face global SecondaryCursor    "%opt{kalolo_white},%opt{kalolo_dark_yellow}+F"
    set-face global SecondaryCursorEol "default,%opt{kalolo_dark_red}+F"
}

# Switching to insert = shades of blue
hook global ModeChange '.*:insert' %{
    set-face global PrimarySelection   "default,rgba:6f9dfe75"
    set-face global PrimaryCursor      "%opt{kalolo_dark_black},%opt{kalolo_light_blue}+F"
    set-face global PrimaryCursorEol   "default,%opt{kalolo_light_magenta}+F"

    set-face global SecondarySelection "default,rgba:6f9dfe45"
    set-face global SecondaryCursor    "%opt{kalolo_light_white},%opt{kalolo_dark_blue}+F"
    set-face global SecondaryCursorEol "default,%opt{kalolo_magenta}+F"
}

