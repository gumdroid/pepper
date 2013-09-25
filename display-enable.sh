#!/system/bin/sh
echo 0 > /sys/class/gpio/gpio59/value
sleep 1
echo 1 > /sys/class/gpio/gpio59/value
