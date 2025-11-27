{
  lib,
  pkgs,
  ...
}: let
  dev = with pkgs; [
    fd
    sd
    pnpm
    omnix
    cachix
    devenv
    direnv
    gnumake
    vi-mongo
    nodejs_24
    shellcheck
    mermaid-cli
    # nix-specific
    nil
    nix-info
    nixpkgs-fmt
  ];

  security = with pkgs; [
    nmap
    gnutls
    tcpdump
    # wireshark # TODO: Figure out why THIS one fails
    # _1password-gui # TODO: Work out the whole user/group requirement thing
    # _1password-cli
  ];

  devops = with pkgs; [
    act
    ansible
    opentofu
    ansible-lint
  ];

  utility = with pkgs; [
    pik
    less # needed for Ubuntu
    just
    tree
    zotero
    lazyssh
    termscp
    cargo-seek
    presenterm
  ];

  linux = with pkgs; [
    lazyjournal
    systemctl-tui
  ];

  x86Linux = with pkgs; [
    impala # wifi management
  ];

  darwin = with pkgs; [
    utm
  ];

  fun = with pkgs; [
    genact
    smassh
    cmatrix
    asciiquarium
  ];
in {
  home.packages = with pkgs;
    [
      (
        writeShellScriptBin "yls"
        (builtins.readFile ./scripts/yls.sh)
      )
      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    ]
    ++ dev
    ++ security
    ++ devops
    ++ utility
    ++ fun
    ++ lib.optionals stdenv.isLinux linux
    ++ lib.optionals (stdenv.isLinux && stdenv.isx86_64) x86Linux
    ++ lib.optionals stdenv.isDarwin darwin;
}
