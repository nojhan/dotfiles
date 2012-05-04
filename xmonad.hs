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
import XMonad.Layout.WindowNavigation
import XMonad.Actions.FloatSnap
import XMonad.Actions.PhysicalScreens

import qualified XMonad.Actions.FlexibleManipulate as Flex

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
        , keys = \c -> bepoKeys c `M.union` keys gnomeConfig c

        -- add a fullscreen tabbed layout that does not avoid covering
        -- up desktop panels before the desktop layouts
        -- desktopLayoutModifiers still allow toggling panel visibility
        , layoutHook = windowNavigation $ desktopLayoutModifiers $ simpleTabbed ||| rtall
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
            , ("M-b p",   prevWS )
            , ("M-b n",   nextWS )
            , ("C-M-<Left>",   prevWS )
            , ("C-M-<Right>",   nextWS )
            -- Move windows among workspaces
            , ("M-u <Left>",  shiftToPrev )
            , ("M-u <Right>", shiftToNext )
            -- Shrink the master area
            , ("M-S-r", sendMessage Shrink)
            -- Expand the master area
            , ("M-r", sendMessage Expand)
            -- Increment the number of windows in the master area
            , ("M-s", sendMessage (IncMasterN 1))
            -- Deincrement the number of windows in the master area
            , ("M-S-s", sendMessage (IncMasterN (-1)))
            -- Cycle through the available layout algorithms
            , ("M-<Return>", sendMessage NextLayout)

            -- Move focus with arrows
            , ("M-<Right>", sendMessage $ Go R)
            , ("M-<Left>", sendMessage $ Go L)
            , ("M-<Up>", sendMessage $ Go U)
            , ("M-<Down>", sendMessage $ Go D)

            -- Swap windows with arrows
            , ("M-S-<Right>", sendMessage $ Swap R)
            , ("M-S-<Left>", sendMessage $ Swap L)
            , ("M-S-<Up>", sendMessage $ Swap U)
            , ("M-S-<Down>", sendMessage $ Swap D)
            -- Swap the focused window and the master window
            , ("M-S-<Return>", windows W.swapMaster)

            -- Move focus to the master window
            , ("M-m", windows W.focusMaster  )
            -- Scratchpad
            , ("M-<Space>", scratchpadSpawnAction gnomeConfig { terminal = "$XTERMCMD" } )
            , ("M-<XF86Calculator>", scratchpadSpawnAction gnomeConfig { terminal = "$XTERMCMD" } )

            -- Move focus to the next physical xinerama screen
            , ("M-$", onPrevNeighbour W.view)

            , ("<XF86HomePage>", runOrRaise "firefox" (className =? "Firefox" <||> className =? "Firefox-bin"))
            , ("<XF86Mail>", spawn "thunderbird -remote \"xfeDoCommand(composeMessage)\"")
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
    `additionalMouseBindings`
        [
            -- Move window with M-mouse1
              ((modm, 1), (\w -> focus w >> windows W.shiftMaster >> Flex.mouseWindow Flex.position w >> snapMagicMove (Just 50) (Just 50) w))
            -- Resize windows with M-mouse3
            , ((modm, 3), (\w -> focus w >> windows W.shiftMaster >> Flex.mouseWindow Flex.resize w >> snapMagicMouseResize 100 (Just 50) (Just 50) w))
        ]
    where
        rtall = ResizableTall 1 (3/100) (1/2) []


-- Workspace switching using first row keycodes
-- for keyboards that do not use numbers here

-- bépo with «/» switched with </>
numBepoNoj = [0x22,0x3c,0x3e,0x28,0x29,0x40,0x2b,0x2d,0x2f,0x2a]
-- normal bépo
numBepo = [0x22,0xab,0xbb,0x28,0x29,0x40,0x2b,0x2d,0x2f,0x2a]
-- azerty
numAzerty = [0x26,0xe9,0x22,0x27,0x28,0x2d,0xe8,0x5f,0xe7,0xe0]

bepoConfig = gnomeConfig { keys = bepoKeys <+> keys gnomeConfig }
bepoKeys conf@(XConfig {modMask = modm}) = M.fromList $
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (workspaces conf) numBepoNoj,
          (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

