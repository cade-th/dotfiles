setxkbmap -option caps:escape
xwallpaper --stretch ~/dotfiles/wallpapers/nightmaze.jpg & 
picom --config ~/.config/picom/picom.conf &
exec dwmblocks &
# Instead of just 'exec dwm'
exec dbus-launch --exit-with-session dwm


