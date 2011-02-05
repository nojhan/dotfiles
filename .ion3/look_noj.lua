-- $Id: look_tibi.lua 78 2007-02-07 18:36:32Z tibi $

-- version : 0.2
-- date    : 2007-02-07
-- author  : Tibor Csögör <tibi@tiborius.net>

-- This style highlights active elements with an `accent' color.  Bright and
-- dimmed variants emphasize the level of importance.  The corresponding neutral
-- colors are (roughly) the non-saturated versions.

-- The author likes the color scheme `gold' best, however, feel free to
-- experiment with the accent color(s).

-- This software is in the public domain.


-- color configuration ---------------------------------------------------------

-- gold
local my_accent_color_bright = "lightgoldenrod1"
local my_accent_color_normal = "gold2"
local my_accent_color_dimmed = "gold3"
local my_accent_color_dark   = "gold4"
local my_accent_color_flashy = "red"
local my_accent_color_error = "tomato"

-- green
-- local my_accent_color_bright = "#c2ffc2"
-- local my_accent_color_normal = "palegreen1"
-- local my_accent_color_dimmed = "palegreen2"
-- local my_accent_color_dark   = "palegreen3"

-- blue
-- local my_accent_color_bright = "lightblue1"
-- local my_accent_color_normal = "skyblue1"
-- local my_accent_color_dimmed = "skyblue2"
-- local my_accent_color_dark   = "skyblue3"

-- plum
-- local my_accent_color_bright = "#ffd3ff"
-- local my_accent_color_normal = "plum1"
-- local my_accent_color_dimmed = "plum2"
-- local my_accent_color_dark   = "plum3"

--------------------------------------------------------------------------------


-- neutral colors
local my_neutral_color_normal = "grey45"
local my_neutral_color_dimmed = "grey20"
local my_neutral_color_dark   = "grey10"


if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    padding_pixels = 2,
    shadow_pixels = 0,
    highlight_pixels = 0,
    border_style = "elevated",
    foreground_colour = "black",
    background_colour = "black",
})

de.defstyle("frame", {
    based_on = "*",
    highlight_pixels = 2,
    shadow_pixels = 2,
    highlight_colour = my_neutral_color_dark,
    shadow_colour = my_neutral_color_dark,
    de.substyle("active", {
        highlight_colour = my_accent_color_normal,
        shadow_colour = my_accent_color_normal,
    }),
    de.substyle("inactive", {
        highlight_colour = my_neutral_color_normal,
        shadow_colour = my_neutral_color_normal,
    }),
})

de.defstyle("frame-tiled", {
    based_on = "frame",
    de.substyle("inactive", {
        highlight_colour = my_neutral_color_dark,
        shadow_colour = my_neutral_color_dark,
    }),
})

de.defstyle("frame-transient", {
    based_on = "frame",
    de.substyle("active", {
        highlight_colour = my_accent_color_flashy,
        shadow_colour = my_accent_color_flashy,
    }),
})

de.defstyle("tab", {
    based_on = "*",
    spacing = 2,
    background_colour = my_neutral_color_dimmed,
    text_align = "center",
    font = "-*-helvetica-bold-r-normal-*-10-*-*-*-*-*-*-*",
    de.substyle("active-selected", {
        background_colour = my_accent_color_normal,
    }),
    de.substyle("active-unselected", {
        background_colour = my_accent_color_dark,
    }),
    de.substyle("inactive-selected", {
        background_colour = my_neutral_color_normal,
    }),
})

de.defstyle("tab-frame-floating", {
    based_on = "tab",
    spacing = 0,
})

de.defstyle("input", {
    based_on = "*",
    padding_pixels = 10,
    highlight_pixels = 1,
    shadow_pixels = 1,
    background_colour = my_accent_color_bright,
    highlight_colour = my_accent_color_dark,
    shadow_colour = my_accent_color_dark,
    font = "-*-terminus-bold-r-*-*-14",
    de.substyle("cursor", {
        background_colour = my_accent_color_flashy,
    }),
    de.substyle("selection", {
        background_colour = my_accent_color_dimmed,
    }),
})

de.defstyle("input-message", {
    based_on = "input",
    background_colour = my_accent_color_error,
})

de.defstyle("stdisp", {
    based_on = "*",
    padding_pixels = 2,
    foreground_colour = "white",
    background_colour = my_neutral_color_dark,
    font = "-*-terminus-medium-r-*-*-13-*-*-*-*-*-*-*",
    de.substyle("critical", {
        foreground_colour = my_accent_color_flashy,
    }),
    de.substyle("important", {
        foreground_colour = my_accent_color_normal,
    })
})

de.defstyle("tab-menuentry", {
    based_on = "*",
    text_align = "left",
    background_colour = my_accent_color_bright,
    font = "-*-helvetica-medium-r-normal-*-12-*-*-*-*-*-*-*",
    de.substyle("inactive-selected", {
        background_colour = my_accent_color_dimmed,
    }),
})

de.defstyle("moveres_display", {
    based_on = "*",
    text_align = "center",
    padding_pixels = 10,
    background_colour = my_accent_color_bright,
    highlight_pixels = 1,
    shadow_pixels = 1,
    highlight_colour = my_accent_color_dark,
    shadow_colour = my_accent_color_dark,
    font = "-*-terminus-bold-r-normal-*-14-*-*-*-*-*-*-*",
})

de.defstyle("actnotify", {
    based_on = "*",
    padding_pixels = 4,
    highlight_pixels = 2,
    shadow_pixels = 2,
    highlight_colour = my_accent_color_normal,
    shadow_colour = my_accent_color_normal,
    background_colour = my_accent_color_flashy,
    foreground_colour = "white",
    font = "-*-helvetica-bold-r-normal-*-10-*-*-*-*-*-*-*",
})

gr.refresh()
