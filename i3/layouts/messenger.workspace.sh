#!/usr/bin/env bash

i3-msg "workspace $1; append_layout $HOME/.config/i3/layouts/messenger.workspace.json; workspace $2"
gnome-terminal --role=irssiterminal -- $HOME/.config/i3/layouts/messenger.workspace.helper.sh &
firefox --class whatsappweb -P whatsappweb --no-remote --new-window https://web.whatsapp.com &
firefox --class threemaweb -P threemaweb --no-remote --new-window https://web.threema.ch &
