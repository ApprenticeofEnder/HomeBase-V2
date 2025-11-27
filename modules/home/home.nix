{
  imports = [
    ../../modules/shared/nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.shellAliases = {
    docker = "podman";
  };
}
