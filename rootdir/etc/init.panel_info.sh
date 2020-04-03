#!/system/bin/sh
# Copyright (c) 2009-2015, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Update the panel color property and Leds brightness
for i in $(seq 5); do
	#Focal
    if [ -f /sys/bus/platform/devices/soc:ts_focal/panel_info/cg_color ]; then
		color=`cat /sys/bus/platform/devices/soc:ts_focal/panel_info/cg_color`
		if [ -n "$color" ]; then
		    /system/bin/log -p i -t panel-info-sh Get panel_color successfully from sys node $color
		    break
		else
		    /system/bin/log -p i -t panel-info-sh Get panel_color unsuccessfully, try again...
		    sleep 1
		    continue
		fi
	#Novatek
    elif [ -f  /sys/bus/platform/devices/soc:ts_novatek/panel_info/cg_color ]; then
        color=`cat /sys/bus/platform/devices/soc:ts_novatek/panel_info/cg_color`
        if [ -n "$color" ]; then
            /system/bin/log -p i -t panel-info-sh Get panel_color successfully from sys node $color
            break
        else
            /system/bin/log -p i -t panel-info-sh Get panel_color unsuccessfully, try again...
            sleep 1
            continue
        fi
    else
	color="0"
	/system/bin/log -p i -t panel-info-sh Get panel_color unsuccessfully, try again...
	sleep 1
    fi
done

for i in $(seq 5); do
	#Focal
    if [ -f  /sys/bus/platform/devices/soc:ts_focal/panel_info/cg_maker ]; then
	panel_vendor=`cat /sys/bus/platform/devices/soc:ts_focal/panel_info/cg_maker`
		if [ -n "$panel_vendor" ]; then
		    /system/bin/log -p i -t panel-info-sh Get panel_vendor successfully from sys node $panel_vendor
		    break
		else
		    /system/bin/log -p i -t panel-info-sh Get panel_vendor unsuccessfully, try again...
		    sleep 1
		    continue
		fi
	#Novatek
    elif [ -f  /sys/bus/platform/devices/soc:ts_novatek/panel_info/cg_maker ]; then
        panel_vendor=`cat /sys/bus/platform/devices/soc:ts_novatek/panel_info/cg_maker`
        if [ -n "$panel_vendor" ]; then
            /system/bin/log -p i -t panel-info-sh Get panel_vendor successfully from sys node $panel_vendor
            break
        else
            /system/bin/log -p i -t panel-info-sh Get panel_vendor unsuccessfully, try again...
            sleep 1
            continue
        fi
    else
	panel_vendor="0"
	/system/bin/log -p i -t panel-info-sh Get panel_vendor unsuccessfully, try again...
	sleep 1
    fi
done

for i in $(seq 5); do
	#Focal
    if [ -f  /sys/bus/platform/devices/soc:ts_focal/panel_info/display_maker ]; then
		panel_display=`cat /sys/bus/platform/devices/soc:ts_focal/panel_info/display_maker`
		if [ -n "$panel_display" ]; then
		    /system/bin/log -p i -t panel-info-sh Get panel_display successfully from sys node $panel_display
		    break
		else
		    /system/bin/log -p i -t panel-info-sh Get panel_display unsuccessfully, try again...
		    sleep 1
		    continue
		fi
	#Novatek
    elif [ -f  /sys/bus/platform/devices/soc:ts_novatek/panel_info/display_maker ]; then
        panel_display=`cat /sys/bus/platform/devices/soc:ts_novatek/panel_info/display_maker`
        if [ -n "$panel_display" ]; then
            /system/bin/log -p i -t panel-info-sh Get panel_display successfully from sys node $panel_display
            break
        else
            /system/bin/log -p i -t panel-info-sh Get panel_display unsuccessfully, try again...
            sleep 1
            continue
        fi
    else
	panel_display=""
	/system/bin/log -p i -t panel-info-sh Get panel_display unsuccessfully, try again...
	sleep 1
    fi
done

case "$color" in
    "1")
        setprop vendor.panel.color WHITE
        ;;
    "2")
        setprop vendor.panel.color BLACK
        ;;
    "3")
        setprop vendor.panel.color RED
        ;;
    "4")
        setprop vendor.panel.color YELLOW
        ;;
    "5")
        setprop vendor.panel.color GREEN
        ;;
    "6")
        setprop vendor.panel.color PINK
        ;;
    "7")
        setprop vendor.panel.color PURPLE
        ;;
    "8")
        setprop vendor.panel.color GOLDEN
        ;;
    "9")
        setprop vendor.panel.color SLIVER
        ;;
    "@")
        setprop vendor.panel.color GRAY
        ;;
    "A")
        setprop vendor.panel.color SLIVER_BLUE
        ;;
    "B")
        setprop vendor.panel.color CORAL_BLUE
        ;;
    *)
        setprop vendor.panel.color UNKNOWN
        ;;
esac
case "$panel_vendor" in
    "1")
        setprop vendor.panel.vendor BIELTPB
        ;;
    "2")
        setprop vendor.panel.vendor LENS
        ;;
    "3")
        setprop vendor.panel.vendor WINTEK
        ;;
    "4")
        setprop vendor.panel.vendor OFILM
        ;;
    "5")
        setprop vendor.panel.vendor BIELD1
        ;;
    "6")
        setprop vendor.panel.vendor TPK
        ;;
    "7")
        setprop vendor.panel.vendor LAIBAO
        ;;
    "8")
        setprop vendor.panel.vendor SHARP
        ;;
    "9")
        setprop vendor.panel.vendor JDI
		;;
    "@")
        setprop vendor.panel.vendor EELY
        ;;
    "A")
        setprop vendor.panel.vendor GISEBBG
        ;;
    "B")
        setprop vendor.panel.vendor LGD
        ;;
    "C")
        setprop vendor.panel.vendor AUO
        ;;
    "D")
        setprop vendor.panel.vendor BOE
        ;;
    "E")
        setprop vendor.panel.vendor DSMUDONG
        ;;
    "F")
        setprop vendor.panel.vendor TIANMA
        ;;
    "G")
        setprop vendor.panel.vendor TRULY
        ;;
    "H")
        setprop vendor.panel.vendor SDC
        ;;
    "I")
        setprop vendor.panel.vendor PRIMAX
        ;;
    "P")
        setprop vendor.panel.vendor SZZC
        ;;
    "Q")
        setprop vendor.panel.vendor GVO
        ;;
    "R")
        setprop vendor.panel.vendor VITALINK
        ;;
    *)
        setprop vendor.panel.vendor UNKNOWN
        ;;
esac
case "$panel_display" in
    "1")
        setprop vendor.panel.display JDI
        ;;
    "2")
        setprop vendor.panel.display LGD
        ;;
    "3")
        setprop vendor.panel.display SHARP
        ;;
    "4")
        setprop vendor.panel.display AUO
        ;;
    "5")
        setprop vendor.panel.display BOE
        ;;
    "6")
        setprop vendor.panel.display TIANMA
        ;;
    "7")
        setprop vendor.panel.display EBBG
        ;;
    "8")
        setprop vendor.panel.display SDC
        ;;
    "9")
        setprop vendor.panel.display EDO
		;;
    "0")
        setprop vendor.panel.display OFILM
        ;;
    "B")
        setprop vendor.panel.display CSOT
        ;;
    *)
        setprop vendor.panel.display UNKNOWN
        ;;
esac
