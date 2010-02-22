#!/bin/sh

set -o errexit

: ${XDG_ETC:="$PREFIX/etc/xdg"}
: ${KDE_APPS_MENU:="${XDG_ETC}/menus/kde4-applications.menu"}
: ${GNOME_APPS_MENU:="${XDG_ETC}/menus/applications.menu"}
: ${USER_MENU_DIR:="${HOME}/.config/menus"}
: ${USER_APPS_MENU:="${USER_MENU_DIR}/applications.menu"}
set -o xtrace

xsltproc --novalid \
	--output applications-kde4-submenu.menu \
	applications-kde4-submenu.xsl ${KDE_APPS_MENU}

xsltproc --novalid \
	--output applications-kde4-exclude.menu \
	applications-kde4-exclude.xsl ${GNOME_APPS_MENU}

xsltproc --novalid \
	--output applications.menu \
	applications.xsl ${USER_APPS_MENU}

install -b -m 644 \
	applications-kde4-submenu.menu \
	applications-kde4-exclude.menu \
	applications.menu \
	$HOME/.config/menus

install -b -m 644 \
	kde-main.directory \
	$HOME/.local/share/desktop-directories

set +o xtrace
echo "Installation successful"
