{
  pkgs,
  config,
  lib,
  ...
}: {
  services.spotifyd = {
    enable = true;
  };
}
