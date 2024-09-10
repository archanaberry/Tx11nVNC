#!/data/data/com.termux/files/usr/bin/bash

# Start Termux X11
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
pulseaudio --kill 2>/dev/null

pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
export XDG_RUNTIME_DIR=${TMPDIR}

termux-x11 :0 >/dev/null &

echo "opening termux x11 service..."
sleep 5  # Wait for X11 to start

# Launch Termux X11 main activity
echo "opening termux x11 app MainActivity..."
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1

# Launch XFCE4 on Termux X11
proot-distro login archlinux --shared-tmp -- /bin/bash -c  '
export PULSE_SERVER=127.0.0.1
export DISPLAY=:0
su - archanaberry -c "env DISPLAY=:0 startxfce4"
'

# Wait for XFCE4 to initialize
sleep 5
exit 0
