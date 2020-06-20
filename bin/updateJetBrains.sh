#!/usr/bin/env zsh

ANDROIDSTUDIO=$(ls -r ${HOME}/Library/Application\ Support/JetBrains/Toolbox/apps/AndroidStudio/ch-0 | head -n 1)
DATAGRIP=$(ls -r ${HOME}/Library/Application\ Support/JetBrains/Toolbox/apps/datagrip/ch-0 | head -n 1)
INTELLIJ=$(ls -r ${HOME}/Library/Application\ Support/JetBrains/Toolbox/apps/IDEA-U/ch-0 | head -n 1)

dockutil --no-restart --add "${HOME}/Library/Application Support/JetBrains/Toolbox/apps/AndroidStudio/ch-0/${ANDROIDSTUDIO}/Android Studio.app" --replacing "Android Studio"
dockutil --no-restart --add "${HOME}/Library/Application Support/JetBrains/Toolbox/apps/datagrip/ch-0/${DATAGRIP}/DataGrip.app" --replacing "DataGrip"
dockutil --no-restart --add "${HOME}/Library/Application Support/JetBrains/Toolbox/apps/IDEA-U/ch-0/${INTELLIJ}/IntelliJ IDEA.app" --replacing "IntelliJ IDEA"

killall Dock
