dim_screens() {
    brightness=$1

    # Check if brightness is provided and within a valid range (between 0.1 and 1.0)
    if [[ -z "$brightness" ]] || [[ $(echo "$brightness" | awk '{print ($1 < 0.1 || $1 > 1.0)}') -eq 1 ]]; then
        echo "Usage: dim_screens <brightness> (where brightness is between 0.1 and 1.0)"
        return 1
    fi

    # Get a list of connected screens
    screens=$(xrandr --query | grep " connected" | awk '{print $1}')

    # Apply the brightness level to each connected screen
    for screen in $screens; do
        xrandr --output "$screen" --brightness "$brightness"
    done

    echo "Set brightness to $brightness for all connected screens."
}

