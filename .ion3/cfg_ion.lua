
dopath("cfg_defaults")

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
    kpress(META.."F1", "ioncore.exec_on(_, XTERM or 'xterm')"),

	-- exec
    kpress(META.."F2", "mod_query.query_exec(_)"),

	-- nouveau bureau
    kpress(META.."F3", "mod_query.query_workspace(_)"),

	-- firefox
    kpress(META.."F4", "ioncore.exec_on(_, 'firefox')"),

	-- firefox
    kpress(META.."F5", "ioncore.exec_on(_, 'nautilus --no-desktop')"),

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
    
    kpress(META.."N", "ioncore.goto_nextact()")
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

-- pour mettre la stalonetray dans le dock
defwinprop {class="stalonetray", statusbar="dock"}

