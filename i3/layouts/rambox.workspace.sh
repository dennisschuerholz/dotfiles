#!/usr/bin/env bash

i3-msg "workspace $1; append_layout $HOME/.config/i3/layouts/rambox.workspace.json; workspace $2"
rambox&
