#!/bin/sh

set -o errexit

: ${XDG_ETC:="$PREFIX/etc/xdg"}
: ${KDE_APPS_MENU:="${XDG_ETC}/menus/kde4-applications.menu"}
: ${GNOME_APPS_MENU:="${XDG_ETC}/menus/applications.menu"}
: ${USER_MENU_DIR:="${HOME}/.config/menus"}
: ${USER_APPS_MENU:="${USER_MENU_DIR}/applications.menu"}
set -o xtrace

xsltproc --novalid \
	--output applications-kde4-only.xml \
	applications-kde4-only.xsl ${KDE_APPS_MENU}

xsltproc --novalid \
	--output applications-kde4-excluded.xml \
	applications-kde4-excluded.xsl ${GNOME_APPS_MENU}

xsltproc --novalid \
	--output applications.xml \
	applications.xsl ${USER_APPS_MENU}

exit 1
install -m 644 \
	applications-kde4-only.xsl applications-kde4-excluded.xsl \
	$HOME/.config/menus

