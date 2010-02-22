XDG_ETC=	$(PREFIX)/etc/xdg
KDE_APPS_MENU=	$(XDG_ETC)/menus/kde4-applications.menu
GNOME_APPS_MENU=$(XDG_ETC)/menus/applications.menu
USER_MENU_DIR=	$(HOME)/.config/menus
USER_APPS_MENU=	$(USER_MENU_DIR)/applications.menu
USER_DESKDIRS=	$(HOME)/.local/share/desktop-directories

INSTALL_DATA=	install -b -m 644

MENU_FILES=	applications-kde4-submenu.menu \
		applications-kde4-exclude.menu \
		applications.menu
DESKDIR_FILES=	kde-main.directory

all: $(MENU_FILES) $(DESKDIR_FILES)

install: all
	$(INSTALL_DATA) $(MENU_FILES) $(USER_MENU_DIR)
	$(INSTALL_DATA) $(DESKDIR_FILES) $(USER_DESKDIRS)

# FIXME does not preserve old settings
deinstall:
	cd $(USER_MENU_DIR) && rm -f $(MENU_FILES)
	cd $(USER_DESKDIRS) && rm -f $(DESKDIR_FILES)

clean:
	rm -f *~ .*~ *.menu

%.menu: %.xsl
	xsltproc --novalid --output $@ $^

applications-kde4-submenu.menu: $(KDE_APPS_MENU)
applications-kde4-exclude.menu: $(GNOME_APPS_MENU)
applications.menu: $(USER_APPS_MENU)

# Create default applications.menu if user does not have one yet
$(USER_APPS_MENU):
	python -c 'from Alacarte.MenuEditor import *; MenuEditor().save()'

.PHONY: all clean deinstall install

