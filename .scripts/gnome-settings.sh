#!/bin/bash

# dconf / gsettings

#	GNOME Shell
# -- Theme -- #
# Dark theme (Adwaita-dark)
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
# -- Search -- #
# Disable external search
gsettings set org.gnome.desktop.search-providers disable-external true
# -- Notifications -- #
# Disable notifications (Do Not Disturb)
#gsettings set org.gnome.desktop.notifications show-banners false
# Disable lock screen notifications
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
# -- File history --
# Disable file history
gsettings set org.gnome.desktop.privacy remember-recent-files false
# Enable automatic deletng temporary files
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
# -- Removable media --
# Never prompt or start programson media insertion
gsettings set org.gnome.desktop.media-handling autorun-never true

#	GNOME WM
# -- Buttons layout -- #
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'

#	GNOME gedit
# -- Theme -- #
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'

#	GNOME Terminal
# -- Theme -- #
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'dark'
# -- Menu acceleration (F10) -- #
gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false
