{
  description = "My home Manager configuration of me";


  # Example: Set a configuration based on the target system
  programs.zsh.enable = config.system == "aarch64-darwin";

  programs = {
    # Define the programs you want to manage here
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
  }: 

  # Define your home directory structure, shell environment, etc.
  home.packages = with pkgs; [
      git
      zellij
      htop
      lazygit

      nodePackages.typescript
      nodePackages.typescript-language-server

       # archives
      zip
      xz
      unzip
      p7zip

      # nix related
      #
      # it provides the command `nom` works just like `nix`
      # with more details log output
      nix-output-monitor

      # productivity
      hugo # static site generator
      glow # markdown previewer in terminal

          btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring


  ];

    # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";


    # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;



    # Example: Set your user information
  users.extraUsers.obwoni000 = {
    createHome = true;
    shell = "~/bin/zsh";
  };
    
};
