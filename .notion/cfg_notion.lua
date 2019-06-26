
dopath("cfg_defaults")

dopath("mod_statusbar")

-- Mod1 = Alt
-- Mod4 = Window
-- rajouter "+" après le code pour les concaténations suivantes
ALTMETA="Mod5+" 
META="Mod1+" 


ioncore.set{
	-- dessine les fenetres lors d'un redimensionnement
    opaque_resize=true,
}

defbindings("WMPlex.toplevel", {
	-- suppression des raccourcis directs sur les touches de fonctions
    kpress("F1", "nil"),
    kpress("F2", "nil"),
    kpress("F3", "nil"),
    kpress("F4", "nil"),
    kpress("F5", "nil"),
    kpress("F6", "nil"),
    kpress("F9", "nil"),
    kpress("F12", "nil"),

	-- lancement xterm
    kpress(META.."F1", "ioncore.exec_on(_, XTERM or 'urxvt')"),

	-- exec
    kpress(META.."F2", "mod_query.query_exec(_)"),

	-- nouveau bureau
    kpress(META.."F3", "mod_query.query_workspace(_)"),

	-- firefox
    kpress(META.."F4", "ioncore.exec_on(_, 'firefox')"),

	-- Nautilus
    kpress(META.."F5", "ioncore.exec_on(_, 'nautilus --no-desktop')"),

	-- Lock
    kpress(META.."l", "ioncore.exec_on(_, 'gnome-screensaver-command -l')"),

	-- menu général ion3
    kpress(META.."F12", "mod_query.query_menu(_, _sub, 'mainmenu', 'Main menu:')")
})


defbindings("WMPlex", {
    bdoc("Close current object."),
    kpress_wait(META.."X", "WRegion.rqclose_propagate(_, _sub)"),
})

defbindings("WScreen", {

	-- Aller à l'écran physique précédent/suivant
    kpress(META.."twosuperior", "ioncore.goto_prev_screen()"),
    kpress(META.."Next", "ioncore.goto_next_screen()"),
    
	-- aller au nième écran physique (attention, inversion pour 2e écran à gauche)
    kpress(META.."Shift+2", "ioncore.goto_nth_screen(0)"),
    kpress(META.."Shift+1", "ioncore.goto_nth_screen(1)"),
    
	-- Aller au cadre suivant/précédent
    kpress(META.."Right", "ioncore.goto_next(_chld, 'right')", "_chld:non-nil"),
    kpress(META.."Left", "ioncore.goto_next(_chld, 'left')", "_chld:non-nil"),

	-- Aller au bureau suivant/précédent
    kpress(META.."Page_Down", "WScreen.switch_next(_)"),
    kpress(META.."Page_Up", "WScreen.switch_prev(_)"),

	-- Aller au bureau n°
    kpress(META.."1", "WScreen.switch_nth(_, 0)"),
    kpress(META.."2", "WScreen.switch_nth(_, 1)"),
    kpress(META.."3", "WScreen.switch_nth(_, 2)"),
    kpress(META.."4", "WScreen.switch_nth(_, 3)"),
    kpress(META.."5", "WScreen.switch_nth(_, 4)"),
    kpress(META.."6", "WScreen.switch_nth(_, 5)"),
    kpress(META.."7", "WScreen.switch_nth(_, 6)"),
    kpress(META.."8", "WScreen.switch_nth(_, 7)"),
    kpress(META.."9", "WScreen.switch_nth(_, 8)"),
    kpress(META.."0", "WScreen.switch_nth(_, 9)"),

    kpress(META.."N", "ioncore.goto_nextact()"),

    bdoc("Create a new workspace of chosen default type."),
    kpress(META.."F9", "ioncore.create_ws(_)")
})

defbindings("WTiling", {
	-- Aller au cadre supérieur/inférieur
    kpress(META.."Up", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    kpress(META.."Down", "ioncore.goto_next(_sub, 'down', {no_ascend=_})")
})

defbindings("WFrame", {
	-- Aller à la fenetre suivante dans le cadre
	kpress(META.."Tab", "_:switch_prev()"),
	--kpress(ALTMETA.."Tab", "_:switch_next()")
	kpress(META.."B", "_:switch_next()")
})

defbindings("WFrame.toplevel", {
	-- Attacher la fenetre marquée (avec META.."T" par défaut)
    kpress(META.."U", "WRegion.set_tagged(_sub, 'toggle')", "_sub:non-nil"),
    kpress(META.."A", "ioncore.tagged_attach(_)")
})

defbindings("WTiling", {
    bdoc("Split current frame horizontally."),
    kpress(META.."S", "WTiling.split_at(_, _sub, 'right', true)"),

    bdoc("Split current frame vertically."),
    kpress(META.."Shift+S", "WTiling.split_at(_, _sub, 'bottom', true)"),

    bdoc("Unsplit (destroy) current frame."),
    kpress(META.."D", "WTiling.unsplit_at(_, _sub)"),
})

defbindings("WScreen", {
    bdoc("Toggle scratchpad."),
    kpress(META.."space", "mod_sp.set_shown_on(_, 'toggle')"),

    -- A more ideal key for toggling the scratchpad would be the key left of
    -- the key for numeral 1. Unfortunately the symbols mapped to this key
    -- vary by the keyboard layout, and to be fully portable to different
    -- architechtures and fancy keyboards, we can't rely on keycodes either.
    -- However, on standard Finnish/Swedish (and other Nordic) keyboard
    -- layouts the following should work:
    --kpress(META.."section", "mod_sp.set_shown_on(_, 'toggle')"),
    -- and on UK and US layouts this should work:
    --kpress(META.."grave", "mod_sp.set_shown_on(_, 'toggle')"),
})

-- pour mettre la stalonetray dans le dock
-- defwinprop {class="stalonetray", statusbar="dock"}

-- WFrame context bindings
--
-- These bindings are common to all types of frames. Some additional
-- frame bindings are found in some modules' configuration files.

defbindings("WFrame", {
    submap(META.."K", {
        bdoc("Maximize the frame horizontally/vertically."),
        kpress("H", "WFrame.maximize_horiz(_)"),
        kpress("V", "WFrame.maximize_vert(_)"),
    }),

    bdoc("Display context menu."),
    mpress("Button3", "mod_menu.pmenu(_, _sub, 'ctxmenu')"),

    bdoc("Begin move/resize mode."),
    kpress(META.."R", "WFrame.begin_kbresize(_)"),

    bdoc("Switch the frame to display the object indicated by the tab."),
    mclick("Button1@tab", "WFrame.p_switch_tab(_)"),
    mclick("Button2@tab", "WFrame.p_switch_tab(_)"),

    bdoc("Resize the frame."),
    mdrag("Button1@border", "WFrame.p_resize(_)"),
    mdrag(META.."Button3", "WFrame.p_resize(_)"),

    bdoc("Move the frame."),
    mdrag(META.."Button1", "WFrame.p_move(_)"),

    bdoc("Move objects between frames by dragging and dropping the tab."),
    mdrag("Button1@tab", "WFrame.p_tabdrag(_)"),
    mdrag("Button2@tab", "WFrame.p_tabdrag(_)"),

    bdoc("Switch to next/previous object within the frame."),
    mclick(META.."Button4", "WFrame.switch_next(_)"),
    mclick(META.."Button5", "WFrame.switch_prev(_)"),
})


-- WMoveresMode context bindings
--
-- These bindings are available keyboard move/resize mode. The mode
-- is activated on frames with the command begin_kbresize (bound to
-- META.."R" above by default).

defbindings("WMoveresMode", {
    bdoc("Cancel the resize mode."),
    kpress("AnyModifier+Escape","WMoveresMode.cancel(_)"),

    bdoc("End the resize mode."),
    kpress("AnyModifier+Return","WMoveresMode.finish(_)"),

    bdoc("Grow in specified direction."),
    kpress("Left",  "WMoveresMode.resize(_, 1, 0, 0, 0)"),
    kpress("Right", "WMoveresMode.resize(_, 0, 1, 0, 0)"),
    kpress("Up",    "WMoveresMode.resize(_, 0, 0, 1, 0)"),
    kpress("Down",  "WMoveresMode.resize(_, 0, 0, 0, 1)"),

    bdoc("Shrink in specified direction."),
    kpress("Shift+Left",  "WMoveresMode.resize(_,-1, 0, 0, 0)"),
    kpress("Shift+Right", "WMoveresMode.resize(_, 0,-1, 0, 0)"),
    kpress("Shift+Up",    "WMoveresMode.resize(_, 0, 0,-1, 0)"),
    kpress("Shift+Down",  "WMoveresMode.resize(_, 0, 0, 0,-1)"),

    bdoc("Move in specified direction."),
    kpress(META.."Left",  "WMoveresMode.move(_,-1, 0)"),
    kpress(META.."Right", "WMoveresMode.move(_, 1, 0)"),
    kpress(META.."Up",    "WMoveresMode.move(_, 0,-1)"),
    kpress(META.."Down",  "WMoveresMode.move(_, 0, 1)"),
})


-- Client window group bindings

defbindings("WGroupCW", {
    bdoc("Toggle client window group full-screen mode"),
    kpress_wait(META.."Return", "WGroup.set_fullscreen(_, 'toggle')"),
})


