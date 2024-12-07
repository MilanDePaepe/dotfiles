if test "$(/Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --show-current-profile-name)" == "build_in_keyboard"; then
    /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile "extern_keyboard"

else
    /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile "build_in_keyboard"
fi
