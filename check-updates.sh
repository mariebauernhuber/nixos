#!/bin/sh
cd /etc/nixos || exit 1

if ! git remote update >/dev/null 2>&1; then
  echo "No network" > /var/run/config-updates.txt
  exit 0
fi

commits_behind=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo 0)
if [ "$commits_behind" -gt 0 ]; then
  echo "UPDATES_AVAILABLE:$commits_behind" > /var/run/config-updates.txt
else
  rm -f /var/run/config-updates.txt
fi

