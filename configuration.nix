{ pkgs, lib, ... }:

{ 
  users.nix.configureBuildUsers = true;
  
    # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

# Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

    # Apps
  # `home-manager` currently has issues adding them to `~/Applications`
  # Issue: https://github.com/nix-community/home-manager/issues/1341
  environment.systemPackages = with pkgs; [
    kitty
    terminal-notifier
  ];

  
  # Fonts
  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
     recursive
     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
   ];


  # Keyboard
  system.keyboard.enableKeyMapping = true;

    # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

}
