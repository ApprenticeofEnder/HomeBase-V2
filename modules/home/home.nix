{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.shellAliases = {
    docker = "podman";
  };
}
