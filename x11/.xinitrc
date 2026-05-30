setxkbmap -option caps:escape
# xwallpaper --stretch ~/dotfiles/wallpapers/joel-vodell-TApAkERW5pQ-unsplash.jpg & 
wmname LG3D &
xwallpaper --stretch ~/dotfiles/wallpapers/alligator.png & 
picom --config ~/.config/picom/picom.conf &
export _JAVA_AWT_WM_NONREPARENTING=1 &
# exec dwmblocks &
# Instead of just 'exec dwm'
exec dbus-launch --exit-with-session dwm


