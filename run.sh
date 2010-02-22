#!/bin/sh

set -o errexit

: ${XDG_ETC:="$PREFIX/etc/xdg"}
: ${KDE_APPS_MENU:="${XDG_ETC}/menus/kde4-applications.menu"}
: ${GNOME_APPS_MENU:="${XDG_ETC}/menus/applications.menu"}

set -o xtrace

xsltproc --novalid \
	--output applications-kde4-only.xml \
	applications-kde4-only.xsl ${KDE_APPS_MENU}

xsltproc --novalid \
	--output applications-kde4-excluded.xml \
	applications-kde4-excluded.xsl ${GNOME_APPS_MENU}

exit
install -m 644 \
	applications-kde4-only.xsl applications-kde4-excluded.xsl \
	$HOME/.config/menus

