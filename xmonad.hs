import XMonad
import XMonad.Config.Gnome
import XMonad.Config.Desktop
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Layout.ResizableTile
import XMonad.Actions.WindowGo
import XMonad.Util.Scratchpad (scratchpadSpawnAction, scratchpadManageHook, scratchpadFilterOutWorkspace)
import XMonad.Config.Azerty

import qualified XMonad.StackSet as W
import qualified Data.Map as M

modm = mod1Mask

main = xmonad $ gnomeConfig
    {
          terminal = "$XTERMCMD"
        , XMonad.modMask = modm
        , focusedBorderColor = "#ffbb00"
        , borderWidth = 3
        -- Switch workspaces with default first azerty row instead of plain numbers
        , keys = \c -> azertyKeys c `M.union` keys gnomeConfig c

        -- add a fullscreen tabbed layout that does not avoid covering
        -- up desktop panels before the desktop layouts
        -- desktopLayoutModifiers still allow toggling panel visibility
        , layoutHook = desktopLayoutModifiers( simpleTabbed ||| rtall )
    }
    -- Simple notation ala emacs
    `additionalKeysP`
        [
            -- Quit session
              ("M-S-q",  spawn "gnome-session-quit")
            -- Lock Screen
            , ("M-l",  spawn "gnome-screensaver-command -l")
            -- Close focused window
            , ("M-c",  kill )
            , ("M-b d",  kill )
            , ("M-x",  kill )
            -- Got to workspaces
            , ("M-b p",    prevWS )
            , ("M-b n",   nextWS )
            -- Move windows among workspaces
            , ("M-u <Left>",  shiftToPrev )
            , ("M-u <Right>", shiftToNext )
            -- Shrink the master area
            , ("M-<Left>", sendMessage Shrink)
            -- Expand the master area
            , ("M-<Right>", sendMessage Expand)
            -- Increment the number of windows in the master area
            , ("M-<Up>", sendMessage (IncMasterN 1))
            -- Deincrement the number of windows in the master area
            , ("M-<Down>", sendMessage (IncMasterN (-1)))
            -- Cycle through the available layout algorithms
            , ("M-<Return>", sendMessage NextLayout)
            -- Move focus to the master window
            , ("M-m", windows W.focusMaster  )
            -- Scratchpad
            , ("M-<Space>", scratchpadSpawnAction gnomeConfig { terminal = "$XTERMCMD" } )
        ]
    -- Extended notation, for F keys (?)
    `additionalKeys` 
        [
              ((modm, xK_F1), spawn "xterm")
            , ((modm, xK_F2), spawn "gmrun")
            -- Launch firefox or raise its window if already running
            , ((modm, xK_F4), runOrRaise "firefox" (className =? "Firefox" <||> className =? "Firefox-bin"))
            -- Launch firefox or raise its window if already running
            , ((modm, xK_F5), spawn "nautilus --no-desktop")
        ]
    where
        rtall = ResizableTall 1 (3/100) (1/2) []

