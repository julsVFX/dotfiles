current_workspace="$(i3-msg -t get_tree | jq -r 'recurse(.nodes[]) | select(.type == "workspace" and ([recurse((.nodes, .floating_nodes)[])] | any(.focused))) | .name')"
floating_workspace="0${current_workspace%:*}"

# Get focused window ID
wid=$(xdotool getactivewindow)

# Function to hide from taskbar
hide_from_taskbar() {
    xprop -id "$wid" -f _NET_WM_STATE 32a -set _NET_WM_STATE _NET_WM_STATE_SKIP_TASKBAR
}

# Function to show in taskbar
show_in_taskbar() {
    xprop -id "$wid" -remove _NET_WM_STATE
}

if i3-msg -t get_tree | jq -e "recurse(.nodes[]) | select(.type == \"workspace\" and .name == \"$current_workspace\") | .floating_nodes | length > 0"; then
    # Move floating windows to temp workspace and hide from taskbar
    i3 "[workspace=$current_workspace floating] move to workspace $floating_workspace"
    hide_from_taskbar
else
    # Move back to original workspace and show in taskbar
    i3-msg '[workspace="'"$floating_workspace"'" floating] move to workspace '"$current_workspace"'; [workspace="'"$current_workspace"'" floating] focus'
    show_in_taskbar
fi
