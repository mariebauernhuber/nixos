#!/bin/sh
cd /etc/nixos
if git remote update &>/dev/null && [ $(git rev-list --count HEAD..origin/master) -gt 0 ]; then
  echo "Updates available in GitHub repo ($(git rev-list --count HEAD..origin/master) commits)."
  echo "Pull changes? (y/N)"
  read -r response
  if [ "$response" = "y" ]; then
    git pull origin main
    echo "Pulled. Run 'sudo nixos-rebuild switch' after login."
  fi
fi

