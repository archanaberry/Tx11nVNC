#!/data/data/com.termux/files/usr/bin/bash

echo "opening vnc service..."
sleep 5

# Start VNC on display :1
kill -9 $(pgrep -f "x11vnc") 2>/dev/null
kill -9 $(pgrep -f "Xvfb") 2>/dev/null

Xvfb :1 -screen 0 1366x768x24 &
sleep 5  # Wait for Xvfb to start

x11vnc -display :1 -N -forever -nopw -geometry 1366x768 &
sleep 5

# Start XFCE4 on VNC
proot-distro login archlinux --shared-tmp -- /bin/bash -c  '
export PULSE_SERVER=127.0.0.1
export DISPLAY=:1
su - archanaberry -c "env DISPLAY=:1 startxfce4"
'

# Wait for XFCE4 to initialize
sleep 5

# Configure extended screen layout
DISPLAY=:0 xrandr --output :1 --right-of :0

echo "opening vnc viewer..."
sleep 5

exit 0
