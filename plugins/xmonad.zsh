# Xmonad settings
killpanel() {
  if [ $XDG_CURRENT_DESKTOP = "MATE" ]
  then
    service="mate-panel"
  elif [ $XDG_CURRENT_DESKTOP = "XFCE" ]
  then
    service="xfce4-panel"
  fi

  ps aux | grep $service | head -n 1 | awk '{print $2}' | xargs kill -9
}

replace(){
  xmonad --replace &; sleep 3 && killpanel
}

