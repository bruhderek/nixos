{
  inputs,
  config,
  pkgs,
  ...
}:

{
  home.username = "derek";
  home.homeDirectory = "/home/derek";

  home.packages = with pkgs; [
    firefox
    neovim
    legcord
    cloudflare-warp
    libgcc
    gdb
    lldb
    nil
    nixfmt-rfc-style
    fzf
    pfetch
    nerdfetch
    pamixer
    wl-clipboard
    cliphist
    dconf-editor
    blueman
    altserver-linux
    irssi
    nix-init
    jetbrains.clion
    renderdoc
  ];

  imports = [
    (import ./hyprland { inherit inputs config pkgs; })
    (import ./cloudflare { inherit config; })
    (import ./waybar { inherit inputs config pkgs; })
    (import ./misc { inherit pkgs config; })
    (import ./scripts { inherit pkgs; })
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
