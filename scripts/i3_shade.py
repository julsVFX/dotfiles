#!/usr/bin/env python3
import i3ipc

# how tall the "shaded" window should be (pixels)
SHADED_HEIGHT = 30

i3 = i3ipc.Connection()
focused = i3.get_tree().find_focused()

# only apply to floating windows
if not focused.floating:
    exit()

# get window rect
rect = focused.rect
x, y, w, h = rect.x, rect.y, rect.width, rect.height

# store current size in the window's marks (hacky but effective)
marks = focused.marks

if "__shaded__" in marks:
    # restore
    try:
        # stored format: __shaded__:<original_height>
        mark = [m for m in marks if m.startswith("__shaded__")][0]
        original_height = int(mark.split(":")[1])
    except Exception:
        original_height = 400  # fallback default
    i3.command(f'[con_id={focused.id}] resize set {w} {original_height}')
    i3.command(f'[con_id={focused.id}] unmark "__shaded__:{original_height}"')
else:
    # shade: shrink to titlebar
    i3.command(f'[con_id={focused.id}] mark "__shaded__:{h}"')
    i3.command(f'[con_id={focused.id}] resize set {w} {SHADED_HEIGHT}')

