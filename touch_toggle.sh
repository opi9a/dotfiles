# toggle Synaptics touchpad

# get the id of the touchpad from xinput
tp_id=`xinput list | grep -i touchpad | awk '{ print $6 }' | sed 's/id=//'`

# is the touchpad on or not?
tp_on=`xinput list-props $tp_id | grep Device\ Enabled | awk '{ print $4 }'`

if [ $tp_on = 0 ]
then
    xinput set-prop $tp_id "Device Enabled" 1
    echo "Touchpad ON"
elif [ $tp_on = 1 ]
then
    xinput set-prop $tp_id "Device Enabled" 0
    echo "Touchpad OFF"
else
    echo "touch_toggle: could not get status from xinput"
fi
