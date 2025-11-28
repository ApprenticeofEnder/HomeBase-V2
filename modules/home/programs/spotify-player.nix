{pkgs, ...}: {
  programs.spotify-player.enable = true;
  home.packages = with pkgs; [
    alsa-lib-with-plugins
  ];
}
