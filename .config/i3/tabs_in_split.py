#/usr/bin/env python3
import sys

# From https://github.com/i3/i3/issues/4207#issuecomment-792874108
# Manage windows as follows:
# - the workspace occupies the full screen, a single container in tabbed mode holding all the current windows
# - one can choose to split that area in half, horizontally or vertically, this creates two new tabbed containers, each occupying half of the screen; one gets the currently-focused window, IIRC, and the other gets the rest of the windows
# - any new window created in any of these new containers ends up as a new tab of one of these containers; new windows don't change the screen layout
# - this process can be repeated on each of these new halves if one so wishes
# In this way, in ion3/notion, the window manager assists you in creating the layout you need, while giving you the possibility of keeping it independent of how many windows you have in a workspace.

# i3ipc requires installation:
sudo apt install python3-i3ipc
# pip3 install i3ipc

from i3ipc import Connection


def tab_and_move_containers(con1, con2, other_cons):
    con1.command('split horizontal')  # force creation of a new parent container for this one
    con1.command('layout tabbed')
    con2.command('split horizontal')  # force creation of a new parent container for this one
    con2.command('layout tabbed')

    con2.command('mark target')
    [con.command('move window to mark target') for con in other_cons]
    con2.command('unmark target')


def main():
    direction = sys.argv[1]
    i3 = Connection()

    con1 = i3.get_tree().find_focused()
    cons = con1.parent.descendants()
    if len(cons) < 2:
        return

    other_cons = [con for con in cons if con.id != con1.id]
    con2 = other_cons.pop()

    # "bisect" the area of interest (split it horiz/vert)
    if direction == 'h':
        i3.command("layout splith")
    else:
        i3.command("layout splitv")

    # relocate containers so there are only two of them visible;
    # con1 will get a tabbed container all to itself,
    # con2 and other_cons will go in the other tabbed container
    # tab_and_move_containers(con1, con2, other_cons)
    tab_and_move_containers(con2, con1, other_cons)


if __name__ == '__main__':
    main()

