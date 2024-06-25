# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # gnome for desktop manager
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };

  networking.hostName = "nixos"; # hostname

  # Enable networking
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yuna = {
    isNormalUser = true;
    description = "yuna";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # search for packages: nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neovim
    syncthing
    vesktop
    steam
    librewolf
    mangohud
    dolphin
    kitty
    waybar
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    swaynotificationcenter
    libnotify
    swww
    pipewire
    pavucontrol
    xfce.thunar
    spotify
    obsidian
    git
    lazygit
    home-manager
    neofetch
    pfetch
    grim
    slurp
    mpv
    wl-clipboard
    cowsay
    rofi-wayland
    vivaldi
    htop
    wofi
    ntfs3g
    mesa
    btop
    helix
    signal-desktop
    spotifyd
    heroic
    ungoogled-chromium
    qutebrowser
    widevine-cdm
    github-desktop
    fastfetch
    # languages
    nil
    rustup
    # tui application (the funny ones)
    wiki-tui
    cava
    youtube-tui
    xplr
    # WMs
    hyprland
    xdg-desktop-portal-hyprland

  ];

  # widevine (?)
  nixpkgs.overlays = [
    (final: prev: {
      qutebrowser = prev.qutebrowser.override { enableWideVine = true; };
    })
  ];

  # gaming
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # fonts
  fonts.packages = with pkgs;
    [
      (nerdfonts.override {
        fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ];
      })
    ];

  # electron
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  # experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "yuna" = import ./home.nix; };
  };

  # ricing with the help of stylix

  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  stylix.image = ./wallpaper/nixos.png;

  stylix.cursor.package = pkgs.apple-cursor;
  stylix.cursor.name = "macOS-BigSur";
  stylix.cursor.size = 16;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetbrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  # grafiktreiber
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;

    ## amdvlk: an open-source Vulkan driver from AMD
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };

  # default shell 
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # printing service
  services.printing.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
