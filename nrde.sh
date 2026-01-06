git add -A
git commit -m "none"
sudo nixos-rebuild switch --flake .#nixos-desktop
