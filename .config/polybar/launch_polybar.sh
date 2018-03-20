if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.dotfiles/.config/polybar/config --reload example &
  done
else
  polybar -c ~/.dotfiles/.config/polybar/config example --reload &
fi
